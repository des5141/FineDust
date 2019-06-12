module.exports = {
    func: (sock, string, user_list) => {
        user_list.forEach(element => {
            try{
                element.post(2, string);
            }catch(e){}
        });
    },
    index: 2
}