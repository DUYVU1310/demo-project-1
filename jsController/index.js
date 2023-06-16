var index = {
    Init: function(){
        index.RenderMenu();
    },
    RegisterEvent: function(){

    },
    RenderMenu: function(){
        $.get('phpController/getMenuControllerViaAjax.php?viTri=nav-bar', function(response){
            var menuData = JSON.parse(response);
            var html = "";
            for(var i = 0; i< menuData.length; i++){
                html += `<li><a href="${menuData[i].slug}">${menuData[i].tenMenu}</a></li>`
            }
            $('.menu-container').html(html);
        })
    }

}
index.Init();