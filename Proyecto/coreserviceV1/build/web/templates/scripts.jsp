<%-- 
    Document   : footer
    Created on : 03-sep-2019, 22:29:11
    Author     : Lenovo
--%>

<script>
        function validar(){
        var contra1 = document.getElementsByTagName("input").namedItem("txtclave").value;
        var contra2 = document.getElementsByTagName("input").namedItem("ValClave").value;
        if(contra1 === contra2){
            document.getElementsByTagName("input").namedItem("txtclave").style.borderColor = "black";
            document.getElementsByTagName("input").namedItem("ValClave").style.borderColor = "black";
            document.getElementById('mensajePass').style.color = 'green';
            document.getElementById('mensajePass').innerHTML="La contraseña coincide correctamente.";
        }else{
            document.getElementsByTagName("input").namedItem("txtclave").style.borderColor = "red";
            document.getElementsByTagName("input").namedItem("ValClave").style.borderColor = "red";
            document.getElementById('mensajePass').style.color = 'red';
            document.getElementById('mensajePass').innerHTML="La contraseña no coincide. Por favor verifica e intenta nuevamente.";
        }
    }
    </script>
        <!--   Core JS Files   -->
            <script src="assets/js/core/jquery.min.js"></script>
            <script src="assets/js/core/popper.min.js"></script>
            <script src="assets/js/core/bootstrap.min.js"></script>
            <script src="assets/js/busqueda.js"></script>
            <script src="assets/js/FontAwesome5.js" type="text/javascript"></script>
            <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
            <!-- Chart JS -->
            <script src="assets/js/plugins/chartjs.min.js"></script>
            <!--  Notifications Plugin    -->
            <script src="assets/js/plugins/bootstrap-notify.js"></script>
            <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
            <script src="assets/js/paper-dashboard.min.js?v=2.0.0" type="text/javascript"></script>
            <!-- Paper Dashboard DEMO methods, don't include it in your project! -->
            <script src="assets/demo/demo.js"></script>
        <script src="assets/Tables/jquery-3.3.1.js"></script>
        <script src="assets/Tables/jquery.dataTables.min.js"></script>
        <script src="assets/Tables/dataTables.bootstrap14.min.js"></script>
        
<script src="logEstilos/js/active.js"></script>
<script src="assets/js/plugins/bootstrap-notify.js" type="text/javascript"></script>
<script src="assets/js/plugins/chartjs.min.js" type="text/javascript"></script>
<script src="assets/js/plugins/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>


        <script>
                                        $(document).ready(function () {
                                            $('#example').dataTable();
                                            $('#example1').dataTable();
                                            $('#example2').dataTable();
                                            $('#FormProd').dataTable();
                                            $('#productos').dataTable();
                                            $('#TablaProductosDet').dataTable();
                                            $('#TablaCartaDet').dataTable();
                                            $('#TablaProductosCarta').dataTable();
                                            $('#TablaProductosRegCarta').dataTable();
                                            $('#FormCarta').dataTable();
                                        });
                                        $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();
                                        
                                        var table = $('#example').DataTable({
    language: {
        "decimal": "",
        "emptyTable": "No hay informacion registrada",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Registros",
        "infoEmpty": "Mostrando 0 de 0 de 0 Registros",
        "infoFiltered": "(Filtrado de _MAX_ total Registros)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Registros",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        },
       
    },
     "lengthMenu":[[3, 5, 10, 20, 50, -1], [3, 5, 10, 20, 50, "Todos"]]
});
var table = $('#FormCarta').DataTable({
    language: {
        "decimal": "",
        "emptyTable": "No hay informacion registrada",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Registros",
        "infoEmpty": "Mostrando 0 de 0 de 0 Registros",
        "infoFiltered": "(Filtrado de _MAX_ total Registros)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Registros",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        },
       
    },
     "lengthMenu":[[3, 5, 10, 20, 50, -1], [3, 5, 10, 20, 50, "Todos"]]
});
var table = $('#TablaProductosRegCarta').DataTable({
    language: {
        "decimal": "",
        "emptyTable": "No hay informacion registrada",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Registros",
        "infoEmpty": "Mostrando 0 de 0 de 0 Registros",
        "infoFiltered": "(Filtrado de _MAX_ total Registros)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Registros",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        },
       
    },
     "lengthMenu":[[3, 5, 10, 20, 50, -1], [3, 5, 10, 20, 50, "Todos"]]
});
$('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();
                                        
                                        var table = $('#example1').DataTable({
    language: {
        "decimal": "",
        "emptyTable": "No hay informacion registrada",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Registros",
        "infoEmpty": "Mostrando 0 de 0 de 0 Registros",
        "infoFiltered": "(Filtrado de _MAX_ total Registros)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Registros",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        }
    },
     "lengthMenu":[[3, 5, 10, 20, 50, -1], [3, 5, 10, 20, 50, "Todos"]]
});
$('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();
                                        
                                        var table = $('#example2').DataTable({
    language: {
        "decimal": "",
        "emptyTable": "No hay informacion registrada",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Registros",
        "infoEmpty": "Mostrando 0 de 0 de 0 Registros",
        "infoFiltered": "(Filtrado de _MAX_ total Registros)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Registros",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        }
    },
     "lengthMenu":[[3, 5, 10, 20, 50, -1], [3, 5, 10, 20, 50, "Todos"]]
});
var table = $('#productos').DataTable({
    language: {
        "decimal": "",
        "emptyTable": "No hay informacion registrada",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Registros",
        "infoEmpty": "Mostrando 0 de 0 de 0 Registros",
        "infoFiltered": "(Filtrado de _MAX_ total Registros)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Registros",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        }
    },
     "lengthMenu":[[3, 5, 10, 20, 50, -1], [3, 5, 10, 20, 50, "Todos"]]
});

var table = $('#TablaProductosDet').DataTable({
    language: {
        "decimal": "",
        "emptyTable": "No hay informacion registrada",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Registros",
        "infoEmpty": "Mostrando 0 de 0 de 0 Registros",
        "infoFiltered": "(Filtrado de _MAX_ total Registros)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Registros",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        }
    },
     "lengthMenu":[[3, 5, 10, 20, 50, -1], [3, 5, 10, 20, 50, "Todos"]]
});
var table = $('#TablaCartaDet').DataTable({
    language: {
        "decimal": "",
        "emptyTable": "AAqui apareceran los productos que ha selecccionado",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Registros",
        "infoEmpty": "Mostrando 0 de 0 de 0 Registros",
        "infoFiltered": "(Filtrado de _MAX_ total Registros)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Registros",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        }
    },
     "lengthMenu":[[3, 5, 10, 20, 50, -1], [3, 5, 10, 20, 50, "Todos"]]
});
        </script>