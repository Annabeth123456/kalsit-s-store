 button_order = ["11","12","21","22","31","32","41","42","51","52","61","62","71","72","81","82",]

 //传值
var add_id;
var sub_id;
var num_id;

 //add
 function add_button(id){
    //传值
    //  get_para(id)
     let add_id = 'add'+id;
     let sub_id = 'sub'+id;
     let num_id = 'num'+id;

     let add = document.getElementById(add_id);
     let sub= document.getElementById(sub_id);
     let num = document.getElementById(num_id);

    //最多加到10,文本框中的值用num.value表示
    if(num.value >= 10){
    num.value = 10;
    }else{
    //要转化成整数
    num.value = parseInt(num.value)+1;
    }
}
    //sub
   function sub_button(id){
       let add_id = 'add'+id;
       let sub_id = 'sub'+id;
       let num_id = 'num'+id;

       let add = document.getElementById(add_id);
       let sub= document.getElementById(sub_id);
       let num = document.getElementById(num_id);

    //最少减到0,文本框中的值用num.value表示
    if(num.value <= 0){
    num.value = 0;
    }else{
    //要转化成整数
    num.value = parseInt(num.value)-1;
    }
}



