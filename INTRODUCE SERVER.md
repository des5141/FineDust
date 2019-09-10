# A3.1 소스코드

## 머릿말

**프로젝트 명** - FineDust  
**시스템 명** - starrySkyServer  
**버전** - ver 0.1  
**작성자** - 김정현  
**작성일** - 2019.07.10

## 내용

### P 3.1 소스코드

-----

**1) main.js**

```js
/*H*****************************************************************
* 프로그램 제목 : starrySkyServer
* 작성일과 버전번호 : 2019.07.10 ver 0.1
*
* 프로그램의 전체적인 목적 -
* 	Gamemaker : studio 1.4 에 정리된 데이터를 넘겨줌
*
* 구조와 설계 -
* 	Socket.io 와 net, http 를 이용하여 네트워크 베이스를 구현
* 	서버의 Event 폴더에 들어있는 Modules 를 Signal 에 알맞게 연결, 들어오는
* 	request 에 알맞게 대응해 response 하는 기능 구현
*
* 공유 변수 -
* 	server, tcp_server, sio_proxy, signal_event, connect_event,
* 	sio_server, socket, fs, ev, file, temp, sock, buffer, token,
* 	mysql, connection, string, result, query_string
*
* 프로그램에서 사용하는 파일 -
* 	database_token.txt : 데이터베이스 연결 정보가 파일에 기술되어있음
*
* 외부참조 모듈과 라이브러리 -
* 	fs, sync-mysql, router.js, net, http, connect.js, socket.io
*****************************************************************H*/

"use strict";
let server = require('./Classes/router.js');

server.listen({
	tcpPort: 5834,
	SocketIOPort: 5883,
	ip: "127.0.0.1"
});
```

-----

**2) connect.js**

```js
/*H*****************************************************************
* 프로그램 제목 : starrySkyServer
* 작성일과 버전번호 : 2019.07.10 ver 0.1
*
* 프로그램의 전체적인 목적 -
* 	Gamemaker : studio 1.4 에 정리된 데이터를 넘겨줌
*
* 구조와 설계 -
* 	Socket.io 와 net, http 를 이용하여 네트워크 베이스를 구현
* 	서버의 Event 폴더에 들어있는 Modules 를 Signal 에 알맞게 연결, 들어오는
* 	request 에 알맞게 대응해 response 하는 기능 구현
*
* 공유 변수 -
* 	server, tcp_server, sio_proxy, signal_event, connect_event,
* 	sio_server, socket, fs, ev, file, temp, sock, buffer, token,
* 	mysql, connection, string, result, query_string
*
* 프로그램에서 사용하는 파일 -
* 	database_token.txt : 데이터베이스 연결 정보가 파일에 기술되어있음
*
* 외부참조 모듈과 라이브러리 -
* 	fs, sync-mysql, router.js, net, http, connect.js, socket.io
*****************************************************************H*/

"use strict";
module.exports = (sock) => {
    console.log("hello")
}
```

------

**3) router.js**

```js
/*H*****************************************************************
* 프로그램 제목 : starrySkyServer
* 작성일과 버전번호 : 2019.07.10 ver 0.1
*
* 프로그램의 전체적인 목적 -
* 	Gamemaker : studio 1.4 에 정리된 데이터를 넘겨줌
*
* 구조와 설계 -
* 	Socket.io 와 net, http 를 이용하여 네트워크 베이스를 구현
* 	서버의 Event 폴더에 들어있는 Modules 를 Signal 에 알맞게 연결, 들어오는
* 	request 에 알맞게 대응해 response 하는 기능 구현
*
* 공유 변수 -
* 	server, tcp_server, sio_proxy, signal_event, connect_event,
* 	sio_server, socket, fs, ev, file, temp, sock, buffer, token,
* 	mysql, connection, string, result, query_string
*
* 프로그램에서 사용하는 파일 -
* 	database_token.txt : 데이터베이스 연결 정보가 파일에 기술되어있음
*
* 외부참조 모듈과 라이브러리 -
* 	fs, sync-mysql, router.js, net, http, connect.js, socket.io
*****************************************************************H*/

"use strict";
// TODO: Make modules
let tcp_server = require('net').createServer();
let sio_proxy = require('http').createServer();
	let sio_server = require('socket.io').listen(sio_proxy);
	sio_server.set('log level', 0);

// TODO: Variables init
let signal_event = new Array();
let connect_event = (require(`./connect.js`));

// ? Event
tcp_server.on('error', function (err) {
	console.log("TCP crashed :\r\n", err.message);
});
sio_proxy.on('error', function (err) {
	console.log("Socket.IO crashed :\r\n", err.message);
});
tcp_server.on('connection', function (sock) {
	new DualSocket(sock, true);
});
sio_server.sockets.on('connection', function (sock) {
	new DualSocket(sock, false);
});

// ? Function
function DualSocket(socket, is_tcp) {
	if (is_tcp) type = 'data'; else type = 'message';
	socket.on(type, (data) => {
		data = JSON.parse(data);
		signal_event[data.id](socket, data.msg);
	});

	function close(func) {
		if (is_tcp) socket.on('close', func); else socket.on('disconnect', func);
	}

	socket.post = (signal, data) => {
		data = JSON.stringify({ id: signal, msg: JSON.stringify(data) });
		if (is_tcp)
			socket.write(data);
		else
			socket.send(data);
	}

	// connect
	connect_event(socket);

	return {
		socket: socket,
		is_tcp: is_tcp,
		close: close
	};
}

// ? Import Signal Event
const fs = require('fs');

function import_script(dir) {
	let ev = fs.readdirSync(dir);
	for (let i = 0; i < ev.length; i++) {
		let file = ev[i];
		if(file.replace(/.*\./gi, "") == "js") {
			let temp = (require(`../${dir}/${ev[i]}`));
			signal_event[temp.index] = temp.func;
			console.log(`   load - ../${dir}/${ev[i]}`.replace("../", ""));
		}

		if(file.match(/.*\./gi) == null) import_script(dir + "/" + ev[i]);
	}
}
import_script("Event")

// ? Export
module.exports = {
	listen: function (option) {
		if (option.tcpPort == option.SocketIOPort)
			throw "# TCP port is must not same to Socket.io port";
		if (option.tcpPort != null)
			tcp_server.listen(option.tcpPort, option.ip);
		if (option.SocketIOPort != null)
			sio_proxy.listen(option.SocketIOPort, option.ip);
	}
}
```

------

**4) send_finedust_data.js**

```js
/*H*****************************************************************
* 프로그램 제목 : starrySkyServer
* 작성일과 버전번호 : 2019.07.10 ver 0.1
*
* 프로그램의 전체적인 목적 -
* 	Gamemaker : studio 1.4 에 정리된 데이터를 넘겨줌
*
* 구조와 설계 -
* 	Socket.io 와 net, http 를 이용하여 네트워크 베이스를 구현
* 	서버의 Event 폴더에 들어있는 Modules 를 Signal 에 알맞게 연결, 들어오는
* 	request 에 알맞게 대응해 response 하는 기능 구현
*
* 공유 변수 -
* 	server, tcp_server, sio_proxy, signal_event, connect_event,
* 	sio_server, socket, fs, ev, file, temp, sock, buffer, token,
* 	mysql, connection, string, result, query_string
*
* 프로그램에서 사용하는 파일 -
* 	database_token.txt : 데이터베이스 연결 정보가 파일에 기술되어있음
*
* 외부참조 모듈과 라이브러리 -
* 	fs, sync-mysql, router.js, net, http, connect.js, socket.io
*****************************************************************H*/

"use strict";
module.exports = {
    func: (sock, string) => {
        const fs = require('fs')
        const token = JSON.parse(fs.readFileSync("database_token.txt"))
        const mysql = require('sync-mysql');
        const connection = new mysql({
        host: token.ip,
        user: token.user,
        password: token.pass,
        port: token.port,
        database: 'finedust'
        })

        string = JSON.parse(string);
        let query_string = `select * from orgnized_data where area="${string.area}" and name="${string.name}" order by time_stamp desc;`;
        let result = connection.query(query_string);
        console.log(result)
        if(result != null) {
            sock.post(1, {
                timestamp: result[0].time_stamp,
                pm10grade: result[0].pm10grade,
                pm10value: result[0].pm10value,
                pm25grade: result[0].pm25grade,
                pm25value: result[0].pm25value
            })
        }
    },
    index: 1
}
```

------

