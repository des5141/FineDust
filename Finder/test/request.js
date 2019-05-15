const request = require('request')
const urlencode = require('urlencode')
const options = {
  uri: 'http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?'
    + 'serviceKey=XZlKvm31hvQ%2FTKvWMQON1daWLiU8dnWjLetAIalzni%2BuuW7ii8TY5B65UanguoVAgBbTggKAcxz8TR6B%2BE%2FJ7A%3D%3D'
    + '&numOfRows=10'
    + '&pageNo=1'
    + '&sidoName=' + urlencode('부산')
    + '&_returnType=json'
}

describe('Network', () => {
  it('Data Request', () => {
    request(options,
      function (err, response, body) {
        var strContents = JSON.parse(body)
        console.log(strContents.list[1])
      }
    );
  });
});