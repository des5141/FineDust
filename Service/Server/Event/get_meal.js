module.exports = {
    func: (sock, string, user_list) => {
        try {
            function replaceAll(str, searchStr, replaceStr) {
                return str.split(searchStr).join(replaceStr);
            }


            var date = new Date();
            var type = "아침";
            if (date.getHours() < 11)
                type = "아침";
            else if (date.getHours() < 13)
                type = "점심";
            else if (date.getHours() < 20)
                type = "저녁";

            var JSSoup = require('jssoup').default;
            var request = require('request');
            var data = "";
            var extract_array = new Array();
            var extract_string = "";
            var url = `http://www.gsm.hs.kr/xboard/board.php?tbnum=8&sYear=${date.getFullYear()}&sMonth=${date.getMonth()}`;

            request(url, (error, response, html) => {
                console.log("test")

                
                // get html
                var soup = new JSSoup(html);
                var lists = soup.findAll('div', 'food_list_box');
                lists = (lists.toString()).split(`<div class="day_num">${date.getDay()}<span>`)[1].split(`<div class="day_num">`)[0];
                lists = replaceAll(lists, "<br></br>", "");
                lists = replaceAll(lists, "&nbsp", "");
                var morning = lists.split(`title="${type}"`)[1].split(`<span class="content">`)[1].split(`</span>`)[0].split("에너지")[0].split(";");
                morning.forEach(element => {
                    if (element.search("\n") != -1)
                        data += element.split("\n")[1] + "\n";
                    else
                        data += element + "\n";
                });
                data = replaceAll(data, "*", "").split("\n");
                for (var i = 0; i < data.length; i++) {
                    if (data[i] != '')
                        extract_array.push(data[i]);
                };
                for (var i = 0; i < extract_array.length; i++) {
                    if (i == extract_array.length - 1)
                        extract_string += extract_array[i];
                    else
                        extract_string += extract_array[i] + "\n";
                }


                sock.post(3, extract_string);
            });
        } catch (e) { console.log(e) }
    },
    index: 3
}