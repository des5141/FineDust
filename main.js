const http = require('http');
const spawn = require('child_process').spawn;
const async = require('async');
const port = 20004; // port

http.createServer(function (req, res) {
  let chunks = [];
  req.on('data', data => chunks.push(data));

  req.on('end', function () {
    let body = JSON.parse(Buffer.concat(chunks).toString());
    
    console.clear();
    console.log("## task run");

    let tasks = [
      (callback) => {
        let run_before = spawn(`${body.repo}_before.bat`);
        run_before.stdout.on('data', (data) => { console.log((data.toString())); });
        run_before.on('exit', () => { callback(null, "before bat"); });
      },
      (callback) => {
        let run = spawn(`${body.repo}.bat`);
        run.stdout.on('data', (data) => { console.log((data.toString())); });
        run.on('exit', () => { callback(null, "main bat"); });
      }
    ];

    async.series(tasks, function (err, results) {
      console.log(`## async\n${results}`);
    });

    res.writeHead(400, { "Content-Type": "application/json" });
    return res.end(JSON.stringify({ "success": true }));
  });
}).listen(port);