<%-- 
    Document   : pedidos
    Created on : 20/08/2019, 08:17:21 AM
    Author     : APRENDIZ
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.pedidoDAO"%>
<%@page import="modeloVO.pedidoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title -->
        <title>Mealvice</title>

        <!-- Favicon -->
        <link rel="icon" href="img/Logotipo.png">

        <!-- Core Stylesheet -->
        <link href="logEstilos/style.css" rel="stylesheet">

        <!-- Responsive CSS -->
        <link href="logEstilos/css/responsive.css" rel="stylesheet">

    </head>

    <body>
        <!-- Preloader Start -->
        <div id="preloader">
            <div class="colorlib-load"></div>
        </div>

        <!-- ***** Header Area Start ***** -->
        <header class="header_area animated" style="background-color: transparent;">
            <div class="container-fluid">

                <div class="row align-items-center">
                    <!-- Menu Area Start -->
                    <div class="col-12 col-lg-10">
                        <div class="menu_area">
                            <nav class="navbar navbar-expand-lg navbar-light">
                                <!-- Logo -->
                                <a class="navbar-brand" href="#">
                                    <img src="img/Logo-nombre-3.png" style="width: 250px; height: 80px; topmargin:20px; "/>
                                </a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ca-navbar" aria-controls="ca-navbar" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                                <!-- Menu Area -->
                                <div class="collapse navbar-collapse" id="ca-navbar">
                                    <ul class="navbar-nav ml-auto" id="nav">
                                        <li class="nav-item active"><a class="nav-link" href="#home">Inicio</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#about">Sobre Nosotros</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#modulos">Modulos</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#contact">Contáctanos</a></li>
                                        
                                    </ul>
                                    <div class="sing-up-button d-lg-none">
                                        <a data-toggle="modal" data-target="#ModalIngresar">  Inicio de Sesión</a>
                                    </div>
                                </div>
                            </nav>
                        </div>
                    </div>
                    

                    <!-- Signup btn -->
                    <div class="col-12 col-lg-2">
                        <div class="sing-up-button d-none d-lg-block">
                            <a  data-toggle="modal" data-target="#ModalIngresar">  Inicio de Sesión</a>
                        </div>
                    </div>
                </div>
            </div>
            <section>
            <% if (request.getAttribute("MensajeError") != null) {%>
                                <div class="alert alert-danger alert-dismissible fade show">
                                    <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                                        <i class="nc-icon nc-simple-remove"></i>
                                    </button>
                                    <span>
                                        <b> Error - </b> El usuario y/o la contraseña son incorrectas,
                                        o no se encuentra registrado en el sistema, verifique e intente nuevamente.</span>
                                </div>
                                <%}%>
                                  <% if (request.getAttribute("MensajeExitoCon") != null) {%>

                                                 <div class="alert alert-info">
                                    
                                    <strong>Información!</strong> Se ha enviado un una contraseña a su correo electronico.
                                </div>
                                                <%}%>
                                 <% if (request.getAttribute("MensajeErrorCon") != null) {%>

                                                 <div class="alert alert-info">
                                    
                                    <strong>Información!</strong> No se ha podido enviar el correo.
                                </div>
                                                <%}%>
        </section>
        </header>
        
        <!-- ***** Header Area End ***** -->
        <div class="modal fade" id="ModalIngresar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Inicio de Sesión</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>     
                    <div class="modal-body">
                        <form method="post" action="Usuario">
                            <div class="row">
                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label>Correo</label>
                                        <input type="email" class="form-control" placeholder="Ej.: correo@correo.com"  name="txtemail" required="" >
                                    </div>
                                </div>

                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label>Contraseña</label>
                                        <input type="password" class="form-control" placeholder="Ej.: ****"  name="txtclave" required="">
                                        <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                                    </div>
                                </div>
                                <div class="col-md-12 pr-1"><hr>
                                    <div class="form-group">
                                        ¿Has olvidado tu contraseña?  <a data-toggle="modal" data-target="#ModalOlvidarContraseña" style="color: #A32727;">Haz clic aquí</a> y podrás recuperarla.
                                    </div>
                                </div>
                                
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-danger" data-dismiss="modal"><i class="nc-icon nc-simple-remove"></i> Cerrar</button>
                        <button type="submit" class="btn btn-success" name="opcion" value="6"><i class="nc-icon nc-check-2"></i>Iniciar Sesión</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
                            
                   <!-- ***** Recuperar Contraseña ***** -->         
            <div class="modal fade" id="ModalOlvidarContraseña" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Recuperar tu contraseña.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>     
                    <div class="modal-body">
                         <div class="alert alert-info">
                                    
                                    <strong>Información!</strong> Para  recuperar tu contraseña, es necesario que ingreses tu correo electrónico 
                                    con el cual te registraste al sistema para poder verificar tu identidad.
                                </div>
                        <form method="post" action="Usuario">
                            <div class="row">
                                <div class="col-md-12 pr-1">
                                    <div class="form-group">
                                        <label>Correo Electronico</label>
                                        <input type="email" class="form-control" placeholder="Ej.: correo@correo.com"  name="txtemail" required="" >
                                    </div>
                                </div>

                               
                               
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-danger" data-dismiss="modal"><i class="nc-icon nc-simple-remove"></i> Cerrar</button>
                        <button type="submit" class="btn btn-success" name="opcion" value="8"><i class="nc-icon nc-check-2"></i>Enviar Correo</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>                
        <!-- ***** Wellcome Area Start ***** -->
        <section class="wellcome_area clearfix" id="home">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12 col-md">
                        <div class="wellcome-heading">
                            <h2>Mealvice</h2>
                            <h3><img src="img/Logotipo.png" alt=""></h3>

                        </div>

                    </div>
                </div>
            </div>
            <!-- Welcome thumb -->
            <div class="welcome-thumb wow fadeInDown" data-wow-delay="500s">
                <!--<img src="img/viajar.png" alt="">-->
            </div>
        </section>
        <!-- ***** Wellcome Area End ***** -->
        
        <!-- ***** Special Area Start ***** -->
        <section class="special-area bg-white section_padding_100" id="about">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <!-- Section Heading Area -->
                        <div class="section-heading text-center">
                            <h2>Sobre Mealvice</h2>
                            <div class="line-shape"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!-- Single Special Area -->
                    <div class="col-12 col-md-4">
                        <div class="single-special text-center wow fadeInUp" data-wow-delay="0.2s">
                            <div class="single-icon">
                                <i class="ti-heart" aria-hidden="true"></i>
                            </div>
                            <h4>Origen</h4>
                            <p>Mealvice nace con la intención de facilitar los 
                                procesos para el restaurante "Nataly".
                            </p>
                        </div>
                    </div>
                    <!-- Single Special Area -->
                    <div class="col-12 col-md-4">
                        <div class="single-special text-center wow fadeInUp" data-wow-delay="0.2s">
                            <div class="single-icon">
                                <i class="ti-target" aria-hidden="true"></i>
                            </div>
                            <h4>¿Hacia que público se dirige el istema?</h4>
                            <p>Mealvice se dirige al sector productivo, para en este caso
                                como restaurantes. Con la finalidad de que la empresa que utilice el sistema
                                tenga una fácil gestión de la misma.
                            </p>
                        </div>
                    </div>
                    <!-- Single Special Area -->
                    <div class="col-12 col-md-4">
                        <div class="single-special text-center wow fadeInUp" data-wow-delay="0.2s">
                            <div class="single-icon">
                                <i class="ti-eye" aria-hidden="true"></i>
                            </div>
                            <h4>Vision</h4>
                            <p>En un futuro buscamos extender nuestros limites a empresas mucho más grandes
                                y procesos mas complejos, asi mismo facilitar aun mas los procesos y poderlos aplicar
                                en otros tipos de empresas.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Special Description Area -->
        </section>
        <!-- ***** Special Area End ***** -->

        <!-- ***** App Screenshots Area Start ***** -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-12" style="background-color: #fff;">
                    <!-- App Screenshots Slides  -->
                    <div class="app_screenshots_slides owl-carousel">
                        <div class="single-shot">
                            <img src="img/Users/img1.jpg" alt="">
                        </div>
                        <div class="single-shot">
                            <img src="img/Users/img2.jpg" alt="">
                        </div>
                        <div class="single-shot">
                            <img src="img/Users/img3.jpg" alt="">
                        </div>
                        <div class="single-shot">
                            <img src="img/Users/img4.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** App Screenshots Area End *****====== -->

    <!-- ***** Client Feedback Area Start ***** -->
    <section class="clients-feedback-area bg-white section_padding_100 clearfix" id="modulos">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <!-- Heading Text  -->
                    <div class="section-heading">
                        <h2>Módulos</h2>
                        <div class="line-shape"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-10">
                    <div class="slider slider-for">
                        <!-- Client Feedback Text  -->
                        <div class="client-feedback-text text-center">
                            <div class="client-description text-center">
                                <p>Módulo de Productos</p>
                            </div>
                            <div class="star-icon text-center">
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                            </div>
                            <div class="client-name text-center">
                                <h5>Productos</h5>
                                <p>Este módulo consta de la gestión respectiva a los productos.</p>
                            </div>
                        </div>
                        <!-- Client Feedback Text  -->
                        <div class="client-feedback-text text-center">
                            <div class="client-description text-center">
                                <p>Módulo de Mesas</p>
                            </div>
                            <div class="star-icon text-center">
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                            </div>
                            <div class="client-name text-center">
                                <h5>Mesas</h5>
                                <p>En realción con el módulo de mesas, se podrá 
                                    realizar una gestión en general sobre la disponibilidad de las mismas.</p>
                            </div>
                        </div>
                        <!-- Client Feedback Text  -->
                        <div class="client-feedback-text text-center">
                            <div class="client-description text-center">
                                <p>Módulo de Pedidos</p>
                            </div>
                            <div class="star-icon text-center">
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                            </div>
                            <div class="client-name text-center">
                                <h5>Pedidos</h5>
                                <p>Este modulo consta del registro de los pedidos correspondientes a cada mesa.</p>
                            </div>
                        </div>
                        <!-- Client Feedback Text  -->
                        <div class="client-feedback-text text-center">
                            <div class="client-description text-center">
                                <p>módulo de Usuarios</p>
                            </div>
                            <div class="star-icon text-center">
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                            </div>
                            <div class="client-name text-center">
                                <h5>Usuarios</h5>
                                <p>En este módulo se gestionará el acceso al 
                                    sistema con su respectivo rol y sus funcionalidades.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Client Thumbnail Area -->
                <div class="col-12 col-md-6 col-lg-5">
                    <div class="slider slider-nav">
                        <div class="client-thumbnail">
                            <i class="fa fa-cubes fa-3x" aria-hidden="true"></i>
                        </div>
                        <div class="client-thumbnail">
                            <i class="fa fa-coffee fa-3x" aria-hidden="true"></i>
                        </div>
                        <div class="client-thumbnail">
                            <i class="fa fa-cart-arrow-down fa-3x" aria-hidden="true"></i>
                        </div>
                        <div class="client-thumbnail">
                            <i class="fa fa-user fa-3x" aria-hidden="true"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Client Feedback Area End ***** -->

    <!-- ***** CTA Area Start ***** -->
    <section class="our-monthly-membership section_padding_50 clearfix" id="team">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <div class="membership-description">
                        <h2>¿Quieres saber como es nuestro sistema?</h2>
                        <p>En el sisguiente enlace, podras encontrar un video ilustrativo
                            en el cual podras ver un pequeño vistazo de como es el sistema.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="get-started-button wow bounceInDown" data-wow-delay="0.5s">
                        <a href="https://www.youtube.com/watch?v=Xgm5dxYPmtk&t=2s">!Haz Clic aquí¡</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** CTA Area End ***** -->

    <!-- ***** Our Team Area Start ***** -->

    <!-- ***** Our Team Area End ***** -->

    <!-- ***** Contact Us Area Start ***** -->
    <section class="footer-contact-area section_padding_100 clearfix" id="contact">
        <div class="container">
            <div class="row">
                <div class="col-bg-6">
                    <!-- Heading Text  -->
                    <div class="section-heading">
                        <h2>Contactanos!</h2>
                        <div class="line-shape"></div>
                    </div>
                    <div class="footer-text">
                        <p>Contactanos para saber mas informacion y realiza tu reserva</p>
                    </div>
                    <div class="address-text">
                        <p><span><i class="ti-email" aria-hidden="true"></i> Email:</span> mealvicegres@gmail.com</p>
                    </div>
                    <div class="address-text">
                        <p><span><i class="ti-headphone-alt" aria-hidden="true"></i> Telefono:</span> +57 (321) 425-5874</p>
                    </div>


                </div>
                <div class="col-md-6">
                    <!-- Form Start-->
                    <div class="contact_from">
                        <form action="#" method="post">

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Contact Us Area End ***** -->

    <!-- ***** Footer Area Start ***** -->
    <footer class="footer-social-icon text-center section_padding_70 clearfix">
        <!-- footer logo -->
        <!-- social icon-->
        <div class="footer-social-icon">
            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            <a href="#"> <i class="fa fa-instagram" aria-hidden="true"></i></a>
            <a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
        </div>
        <div class="footer-menu">
            <nav>
                <ul>
                    <li><a href="#about">Sobre Mealvice</a></li>
                    <li><a data-dismiss="modal" aria-label="Close">Politicas de privacidad</a></li>
                    <li><a href="#contact">Contactanos</a></li>
                </ul>
            </nav>

        </div>
        <button type="button" class="btn" data-toggle="modal" data-target="#exampleModal" style="border: none; background-color: transparent; color: gray;">
            Terminos &amp; Condiciones
        </button>
        <!-- Foooter Text-->
        <div class="copyright-text">
            <!-- ***** Removing this text is now allowed! This template is licensed under CC BY 3.0 ***** -->
            <p>Copyright ©2019 Mealvice <a href="#" target="_blank">Mealvice</a></p>
        </div>
    </footer>
    <!-- ***** Footer Area Start ***** -->
    <!-- Button trigger modal -->


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel" >Terminos &amp; Condiciones</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div ><strong>INFORMACIÓN RELEVANTE</strong></div>
                </p><p>Es requisito necesario para la adquisición de los productos que se ofrecen en este sitio, que lea y acepte los siguientes Términos y Condiciones que a continuación se redactan. El uso de nuestros servicios así como la compra de nuestros productos implicará que usted ha leído y aceptado los Términos y Condiciones de Uso en el presente documento. Todas los productos  que son ofrecidos por nuestro sitio web pudieran ser creadas, cobradas, enviadas o presentadas por una página web tercera y en tal caso estarían sujetas a sus propios Términos y Condiciones. En algunos casos, para adquirir un producto, será necesario el registro por parte del usuario, con ingreso de datos personales fidedignos y definición de una contraseña.
                El usuario puede elegir y cambiar la clave para su acceso de administración de la cuenta en cualquier momento, en caso de que se haya registrado y que sea necesario para la compra de alguno de nuestros productos. www.mealvicegrs.com no asume la responsabilidad en caso de que entregue dicha clave a terceros.
                Todas las compras y transacciones que se lleven a cabo por medio de este sitio web, están sujetas a un proceso de confirmación y verificación, el cual podría incluir la verificación del stock y disponibilidad de producto, validación de la forma de pago, validación de la factura (en caso de existir) y el cumplimiento de las condiciones requeridas por el medio de pago seleccionado. En algunos casos puede que se requiera una verificación por medio de correo electrónico.
                Los precios de los productos ofrecidos en esta Tienda Online es válido solamente en las compras realizadas en este sitio web.</p>

            <strong>LICENCIA</strong><p>Mealvice&nbsp; a través de su sitio web concede una licencia para que los usuarios utilicen  los productos que son vendidos en este sitio web de acuerdo a los Términos y Condiciones que se describen en este documento.</p>

            <strong>USO NO AUTORIZADO</strong>
            <p>En caso de que aplique (para venta de software, templetes, u otro producto de diseño y programación) usted no puede colocar uno de nuestros productos, modificado o sin modificar, en un CD, sitio web o ningún otro medio y ofrecerlos para la redistribución o la reventa de ningún tipo.</p>

            <strong>PROPIEDAD</strong>
            <p>Usted no puede declarar propiedad intelectual o exclusiva a ninguno de nuestros productos, modificado o sin modificar. Todos los productos son propiedad  de los proveedores del contenido. En caso de que no se especifique lo contrario, nuestros productos se proporcionan  sin ningún tipo de garantía, expresa o implícita. En ningún esta compañía será  responsables de ningún daño incluyendo, pero no limitado a, daños directos, indirectos, especiales, fortuitos o consecuentes u otras pérdidas resultantes del uso o de la imposibilidad de utilizar nuestros productos.</p>

            <strong>COMPROBACIÓN ANTIFRAUDE</strong><p>La compra del cliente puede ser aplazada para la comprobación antifraude. También puede ser suspendida por más tiempo para una investigación más rigurosa, para evitar transacciones fraudulentas.</p>

            <strong>PRIVACIDAD</strong><p>Este <a href="https://www.mealvicegres.com" target="_blank">www.mealvicegres.com</a> garantiza que la información personal que usted envía cuenta con la seguridad necesaria. Los datos ingresados por usuario o en el caso de requerir una validación de los pedidos no serán entregados a terceros, salvo que deba ser revelada en cumplimiento a una orden judicial o requerimientos legales.
                La suscripción a boletines de correos electrónicos publicitarios es voluntaria y podría ser seleccionada al momento de crear su cuenta.
                Mealvice reserva los derechos de cambiar o de modificar estos términos sin previo aviso.</p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
    </div>
</div>
</div>
<!-- Jquery-2.2.4 JS -->
<script src="logEstilos/js/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="logEstilos/js/popper.min.js"></script>
<!-- Bootstrap-4 Beta JS -->
<script src="logEstilos/js/bootstrap.min.js"></script>
<!-- All Plugins JS -->
<script src="logEstilos/js/plugins.js"></script>
<!-- Slick Slider Js-->
<script src="logEstilos/js/slick.min.js"></script>
<!-- Footer Reveal JS -->
<script src="logEstilos/js/footer-reveal.min.js"></script>
<!-- Active JS -->
<script src="logEstilos/js/active.js"></script>
<script src="assets/js/plugins/bootstrap-notify.js" type="text/javascript"></script>
<script src="assets/js/plugins/chartjs.min.js" type="text/javascript"></script>
<script src="assets/js/plugins/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
<script src="assets/demo/demo.js" type="text/javascript"></script>
</body>

</html>

