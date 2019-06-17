module.exports = {
    func: (sock, string, user_list) => {
        try {
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
            if (result != null) {
                sock.post(1, JSON.stringify({
                    timestamp: result[0].time_stamp,
                    pm10grade: result[0].pm10grade,
                    pm10value: result[0].pm10value,
                    pm25grade: result[0].pm25grade,
                    pm25value: result[0].pm25value
                }))
            }
        } catch (e) { }
    },
    index: 1
}