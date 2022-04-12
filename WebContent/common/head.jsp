<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<base href="${pageContext.servletContext.contextPath}/">




<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 -->

<!-- <link rel="stylesheet" href="bootstrap/design-css.css"> -->
<style>
	*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body{
    font-family: 'Poppins', sans-serif;
}

.navbar{
    display: flex;
    align-items: center;
    padding: 20px;
}
nav{
    flex: 1;
    text-align: right;
}
nav ul{
    display: block;
    list-style-type: none;
}
nav ul li{
    display: inline-block;
}
nav ul li a{
    display: inline-block;
    padding: 10px 20px;
    font-weight: bold;
}
nav ul li a:hover{
	background: cornflowerblue;
    padding:20px;
    transition: padding 1s;
    color: white;
}
.xin-chao{
	margin: 0 20px;
}
.xin-chao a{
	text-decoration:underline;
	font-weight: bold;
}
.xin-chao a:hover{
	background: cornflowerblue;
    padding:20px;
    transition: padding 1s;
    color: white;
}
.logout{
	padding: 5px;
}
.gio-do{
	width: 30px;
	height: 20px;
}
a{
    text-decoration: none;
    color: #555;
}
p{
    color: #555;
}
.container{
    max-width: 1300px;
    margin: auto;
    padding-left: 25px;
    padding-right: 25px;
}
.row{
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    justify-content: space-around;
}
.col-2{
    flex-basis: 50%;
    min-width: 300xp;
}
.col-2 img{
    max-width: 100%;
    padding: 50px 0;
}
.col-2 h1{
    font-size: 50px;
    line-height: 60px;
    margin: 25px 0;
	color: cornflowerblue;
}
.btn{
    display: inline-block;
    background: cornflowerblue;
    color: #fff;
    padding: 8px 30px;
    margin: 30px 0;
    border-radius: 30px;
    transition: background 0.5s;    
}
.btn:hover{
    background: #563434;

}
.header{
    /* background: radial-gradient(#fff,#ffd6d6); */

}
.header row{
    margin-top: 70px;
}
.categories{
    margin: 70px 0;
}
.col-3{
    flex-basis: 30%;
    min-width: 250px;
    margin-bottom: 30px;

}
.col-3 img{
    width: 100%;
}
.small-container{
    max-width: 1080px;
    margin: auto;
    padding-left: 25px;
    padding-right: 25px;
}
.col-4{
    flex-basis: 25%;
    padding: 10px;
    min-width: 200px;
    margin-bottom: 50px;
    transition: transform 0.5s;
}
.col-4 img{
    width: 100%;
}
.title{
    text-align: center;
    margin: 0 auto 80px;
    position: relative;
    line-height: 60px;
    color: #555;
}
.title::after{
    content: '';
    background: cornflowerblue;
    width: 80px;
    height: 5px;
    border-radius: 5px;
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
}
h4{
    color: #555;
    font-weight: normal;
}
.col-4 p{
    font-size: 14px;
}
.rating .fa{
    color: #ff523b;
}
.col-4:hover{
    transform: translateY(-5px);
}
/* --------- offer ---------- */
.offer{
    background: radial-gradient(#fff,#ffd6d6);
    margin-top: 80px;
    padding: 35px 0;   
}
.col-2 .offer-img{
    padding: 50px;
}
small{
    color: #555;
}
/* ------------------testimonial-------------- */
.testimonial{
    padding-top: 40px;
}
.testimonial .col-3{
    text-align: center;
    padding: 40px 20px;
    box-shadow: 0 0 20px 0px rgba(0, 0, 0, 0.1);
    transition: transform 0.5s;
    cursor: pointer;
}
.testimonial .col-3 img{
    width: 50px;
    margin-top: 20px;
    border-radius: 50%;
}
.testimonial .col-3:hover{
    transform: translateY(-10px);
}
.fa.fa-qoute-lef{
    font-size: 34px;
    color: #ff523b;
}
.col-3 p{
    font-size: 12px;
    margin: 12px 0;
    color: #777;
}
.testimonial .col-3 h3{
    font-weight: 600;
    color: #555;
    font-size: 16px;
}
/* ---------------brands-------------------- */
.brands{
    margin: 40px auto;
}
.col-5{
    width: 160px;
}
.col-5 img{
    width: 100%;
    cursor: pointer;
    filter: grayscale(100%);
}
.col-5 img:hover{
    filter: grayscale(0);
}
/* ---------------footer------------ */

.footer{
    background: #000;
    color: #8a8a8a;
    font-size: 14px;
    padding: 60px 0 20px;
}
.footer p{
    color: #8a8a8a;
}
.footer h3{
    color: #fff;
}
.footer-col-1, .footer-col-2, .footer-col-3, .footer-col-4{
    min-width: 250px;
    margin-bottom: 20px;
}
.footer-col-1{
    flex-basis: 30%;
}
.footer-col-2{
    flex: 1;
    text-align: center;
}
.footer-col-2 img{
    width: 180px;
    margin-bottom: 20px;
}
.footer-col-3, .footer-col-4{
    flex-basis: 12%;
    text-align: center;
}
ul{
    list-style-type: none;
}
.app-logo{
    margin-top: 20px;
}
.app-logo img{
    width: 140px;
}
.footer hr{
    border: none;
    background: #b5b5b5;
    height: 1px;
    margin: 20px 0;
}
.Copyright{
    text-align: center;
}
.menu-icon{
    width: 28px;
    margin-left: 20px;
    display: none;
}


/* ---------------All Products Page------------------- */
.row-2{
    justify-content: space-between;
    margin: 50px auto 50px;
}
select{
    border: 1px solid cornflowerblue;
    padding: 5px;
}
select:focus{
    outline: none;
}
/* .page-btn{
    margin: 0 auto 80px;

}
.page-btn span{
    display: inline-block;
    border: 1px solid #ff523b;
    margin-left: 10px;
    width: 40px;
    height: 40px;
    text-align: center;
    line-height: 40px;
    cursor: pointer;
}
.page-btn span:hover{
    background: #ff523b;
    color: #fff;
} */

/* -- ---------- single Products detail ----------- -- */
.single-product{
    margin-top: 80px;

}
.single-product .col-2 img{
    padding: 0;
}
.single-product .col-2{
    padding: 20px;
}
.single-product h4{
    margin: 20px 0;
    font-size: 22px;
    font-weight: bold;
}
.single-product select{
    display: block;
    padding: 10px;
    margin-top: 20px;
}
.single-product input{
    width: 50px;
    height: 40px;
    padding-left: 10px;
    font-size: 20px;
    margin-right: 10px;
    border: 1px solid cornflowerblue;
}
input:focus{
    outline: none;
}
.single-product .fa{
    color: #ff523b;
    margin-left: 10px;
}
.small-img-row{
    display: flex;
    justify-content: space-between;
}
.small-img-rol{
    flex-basis: 24%;
    cursor: pointer;
}
/* -----------------cart item details------------------- - */
.cart-page{
    margin: 80px auto;
}
table{
    width: 100%;
    border-collapse: collapse;

}
.cart-info{
    display: flex;
    flex-wrap: wrap;
}
th{
    text-align: center;
    padding: 5px;
    color: #fff;
    background: cornflowerblue;
    font-weight: normal;
}
td{
    padding: 10px 5px;
    text-align: center;
}
td input{
    width: 60px;
    height: 30px;
    padding: 5px;

}
td a{
    color: #ff523b;
    font-size: 12px;
}
td img {
    width: 80px;
    height: 117px;
    margin-right: 10px;
}
.total-price{
    display: flex;
    justify-content: flex-end;
}
.total-price table{
    border-top: 3xp solid #ff523b;
    width: 100%;
    max-width: 350px;
}
td:last-child{
    text-align: right;
}
.th:last-child{
    text-align: right;
}


/* -----------------------Account-page------------------ */

.account-page{
    padding: 50px 0;
    background: radial-gradient(#fff,#ffd6d6);

}
.form-container{
    background: #fff;
    width: 300px;
    height: 450px;
    position: relative;
    text-align: center;
    padding: 20px 0;
    margin: auto;
    box-shadow: 0 0 20 0px rgba(0, 0, 0, 0.1);
    overflow: hidden;
}
.form-container span{
    font-weight: bold;
    padding: 0 10px;
    color: #555;
    cursor: pointer;
    display: inline;
}
.form-btn{
    display: inline-block;
}
.form-container form{
    width: 300px;
    padding: 0 20px;
    position: absolute;
    top: 130px;
    transition: transform 1s;

}
form input{
    width: 100%;
    height: 30px;
    margin: 10px 0;
    padding: 0 10px;
    border: 1px solid #ccc;
}
form .btn{
    width: 100%;
    border: none;
    cursor: pointer;
    margin: 10px 0;
}
form .btn:focus{
    outline: none;
}
#LoginForm{
    left: 0;
}
#RegForm{
    left: 300px;
}
form a{
    font-size: 12px;
}
#Indicator{
    width: 100px;
    border: none;
    background: cornflowerblue;
    height: 3px;
    margin-top: 8px;
    transform: translateX(0px);
    transition: transform 1s;
}


/* --------------- Media query FOR menu -------------- */
@media only screen and (max-width: 800px){
    nav ul{
        position: absolute;
        top: 70px;
        left: 0;
        background: #333;
        width: 100%;
        overflow: hidden;
        transition: max-height 0.5s;
    }
    nav ul li{
        display: block;
        margin-right: 50px;
        margin-top: 10px;
        margin-bottom: 10px;
    }
    nav ul li{
        color: #fff;
    }
    .menu-icon{
        display: block;
        cursor: pointer;
    }
}
/* --------------- Media query FOR less than 600 screen siza -------------- */
@media only screen and (max-width: 600px){
    .row{
        text-align: center;
    }
    .col-2, .col-3, .col-4{
        flex-basis: 100%;
    }
    .single-product .row{
        text-align: left;
    }
    .single-product .col-2{
        padding: 20px 0;
    }
    .single-product h1{
        font-size: 26px;
        line-height: 32px;
    }
    .cart-info p{
        display: none;
    }
}










.justify-content-end {
    justify-content: flex-end!important;
}
.pagination {
    display: flex;
    padding-left: 0;
    list-style: none;
}li {
    display: list-item;
    text-align: -webkit-match-parent;
   
}
.page-link {
    position: relative;
    display: block;
    color: #35322f;
    text-decoration: none;
    background-color: #fff;
    border: 1px solid #dee2e6;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
.page-item:first-child .page-link {
    border-top-left-radius: .25rem;
    border-bottom-left-radius: .25rem;
}
.page-link {
    padding: .375rem .75rem;
}
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: cornflowerblue;
}
.page-link:hover {
    z-index: 2;
    color: white;
    background-color: cornflowerblue;
    border-color: #dee2e6;
}
.orderup{
	text-align:right;
	margin-top: 30px;
}

</style>


