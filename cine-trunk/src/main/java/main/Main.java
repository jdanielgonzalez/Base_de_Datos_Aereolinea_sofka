package main;

import integration.database.mysql.MySqlOperations;
import org.apache.log4j.PropertyConfigurator;
import java.sql.SQLException;
import java.util.Scanner;

import static util.enums.Log4jValues.LOG4J_PROPERTIES_FILE_PATH;
import static util.enums.SystemProperties.USER_DIR;

public class Main {

    private static final String SERVER = "sofka-training.cpxphmd1h1ok.us-east-1.rds.amazonaws.com";
    private static final String DATA_BASE_NAME = "JuanDanielGonzalez_Aereolinea_10092021";
    private static final String USER = "sofka_training";
    private static final String PASSWORD = "BZenX643bQHw";

    private static final String VISTA_PERSONAS = String.format("select * from %s.vista_personas", DATA_BASE_NAME);
    private static final String VISTA_PERSONAS_TEL_CORREO = String.format("select * from %s.vista_personas_tel_correo", DATA_BASE_NAME);
    private static final String VISTA_EMPLEDO_TEL_CORREO = String.format("select * from %s.vista_empleado_tel_correo", DATA_BASE_NAME);
    private static final String VISTA_CLIENTE_TEL_CORREO = String.format("select * from %s.vista_cliente_tel_correo", DATA_BASE_NAME);
    private static final String VISTA_TRANSPORTE = String.format("select * from %s.vista_transporte", DATA_BASE_NAME);
    private static final String VISTA_VENTA = String.format("select * from %s.vista_venta", DATA_BASE_NAME);
    private static final String VISTA_CHECK_IN = String.format("select * from %s.vista_check_in", DATA_BASE_NAME);
    private static final String VISTA_TIQUETES = String.format("select * from %s.vista_tiquetes", DATA_BASE_NAME);
    private static final String VISTA_VUELOS = String.format("select * from %s.vista_vuelos", DATA_BASE_NAME);
    private static final String VISTA_CONDUCCIONES_AVION = String.format("select * from %s.vista_conducciones_avion", DATA_BASE_NAME);
    private static final String VISTA_CONDUCCIONES_BUS = String.format("select * from %s.vista_conducciones_bus", DATA_BASE_NAME);
    private static final String VISTA_EQUIPAJE = String.format("select * from %s.vista_equipaje", DATA_BASE_NAME);

    private static Scanner entrada_general = new Scanner(System.in);

    private static final MySqlOperations mySqlOperations = new MySqlOperations();

    public static void main(String[] args) throws Exception {
        PropertyConfigurator.configure(USER_DIR.getValue() + LOG4J_PROPERTIES_FILE_PATH.getValue());

        Scanner entrada = new Scanner(System.in);
        String cadena_opciones = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15";
        String opcion="";
        login();
        boolean salir =false;
        bienvenido();
        while (!salir)
        {
            menu();
            System.out.print("opcion: ");
            opcion=entrada.nextLine();
            while(!cadena_opciones.contains(opcion) || opcion.equals(",") || opcion.equals(""))
            {
                System.out.println("La opcion ingresada no es correcta!");
                System.out.print("opcion: ");
                opcion=entrada.nextLine();
            }

            switch (opcion)
            {
                case "0":
                    salir=true;
                    terminado();
                    break;

                case "1":
                    System.out.println("Mostrando a todas las personas y su informacion.");
                    vista_personas();
                    presioneTecla();
                    break;

                case "2":
                    System.out.println("Mostrando telefonos y correos de todas las personas.");
                    vista_personas_tel_correo();
                    presioneTecla();
                    break;

                case "3":
                    System.out.println("Mostrando telefonos y correos de los empleados.");
                    vista_empleado_tel_correo();
                    presioneTecla();
                    break;

                case "4":
                    System.out.println("Mostrando telefonos y correos de los clientes.");
                    vista_cliente_tel_correo();
                    presioneTecla();
                    break;

                case "5":
                    System.out.println("Mostrando personas que trabajan en el area de transporte.");
                    vista_transporte();
                    presioneTecla();
                    break;

                case "6":
                    System.out.println("Mostrando personas que trabajan en el area de ventas.");
                    vista_venta();
                    presioneTecla();
                    break;

                case "7":
                    System.out.println("Mostrando personas que trabajan en el area de check_in.");
                    vista_check_in();
                    presioneTecla();
                    break;

                case "8":
                    System.out.println("Mostrando los tiquetes que comparon las personas.");
                    vista_tiquetes();
                    presioneTecla();
                    break;

                case "9":
                    System.out.println("Mostrando todos los vuelos disponibles.");
                    vista_vuelos();
                    presioneTecla();
                    break;

                case "10":
                    System.out.println("Mostrando el historial de los pilotos.");
                    vista_conducciones_avion();
                    presioneTecla();
                    break;

                case "11":
                    System.out.println("Mostrando el historial de los conductores.");
                    vista_conducciones_bus();
                    presioneTecla();
                    break;

                case "12":
                    System.out.println("Mostrando el equipaje que lleva las personas");
                    vista_equipaje();
                    presioneTecla();
                    break;

                case "13":
                    System.out.println("contanto el numero de maletas que tiene una persona");
                    sp_contar_equipaje();
                    presioneTecla();
                    break;

                case "14":
                    System.out.println("contando el numero de pasajeros que tiene vuelo");
                    sp_contar_pasajeros();
                    presioneTecla();
                    break;

                case "15":
                    System.out.println("Creando un nuevo cliente.");
                    sp_crear_nuevo_cliente();
                    presioneTecla();
                    break;
            }
        }
        logout();
    }

    private static void login(){
        mySqlOperations.setServer(SERVER);
        mySqlOperations.setDataBaseName(DATA_BASE_NAME);
        mySqlOperations.setUser(USER);
        mySqlOperations.setPassword(PASSWORD);
    }

    private static void vista_personas() throws SQLException {
        mySqlOperations.setSqlStatement(VISTA_PERSONAS);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void vista_personas_tel_correo() throws SQLException {
        mySqlOperations.setSqlStatement(VISTA_PERSONAS_TEL_CORREO);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void vista_empleado_tel_correo() throws SQLException {
        mySqlOperations.setSqlStatement(VISTA_EMPLEDO_TEL_CORREO);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void vista_cliente_tel_correo() throws SQLException {
        mySqlOperations.setSqlStatement(VISTA_CLIENTE_TEL_CORREO);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void vista_transporte() throws SQLException {
        mySqlOperations.setSqlStatement(VISTA_TRANSPORTE);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void vista_venta() throws SQLException {
        mySqlOperations.setSqlStatement(VISTA_VENTA);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void vista_check_in() throws SQLException {
        mySqlOperations.setSqlStatement(VISTA_CHECK_IN);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void vista_tiquetes() throws SQLException {
        mySqlOperations.setSqlStatement(VISTA_TIQUETES);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void vista_vuelos() throws SQLException {
        mySqlOperations.setSqlStatement(VISTA_VUELOS);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void vista_conducciones_avion() throws SQLException {
        mySqlOperations.setSqlStatement(VISTA_CONDUCCIONES_AVION);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void vista_conducciones_bus() throws SQLException {
        mySqlOperations.setSqlStatement(VISTA_CONDUCCIONES_BUS);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void vista_equipaje() throws SQLException {
        mySqlOperations.setSqlStatement(VISTA_EQUIPAJE);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void sp_contar_equipaje() throws SQLException {
        System.out.println("Ingrese el identificador del usuario asi: 123456789");
        System.out.print("identificador: ");
        String aux ="";
        aux = entrada_general.nextLine();
        aux = "call sp_contar_equipaje('"+aux+"')";
        mySqlOperations.setSqlStatement(aux);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void sp_contar_pasajeros() throws SQLException {
        System.out.println("Ingrese el numero de vuelo asi: 1");
        System.out.print("vuelo: ");
        String aux ="";
        aux = entrada_general.nextLine();
        aux = "call sp_contar_pasajeros('"+aux+"')";
        mySqlOperations.setSqlStatement(aux);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void sp_crear_nuevo_cliente() throws SQLException {
        System.out.println("Ingrese el numero de vuelo asi:\n"+
                "'12345678','Nombre','Apellido','yyyy-mm-dd','tipo',1234)");
        System.out.print("datos: ");
        String aux ="";
        aux = entrada_general.nextLine();
        aux = "call sp_crear_nuevo_cliente("+aux+")";
        System.out.println("Cliente creado");
        mySqlOperations.setSqlStatement(aux);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void menu()
    {
        System.out.println("Opciones:\n"+
                "1: Vista completa de Personas \n" +
                        "2: Vista completa de correos y telefonos \n" +
                        "3: Vista completa de correos y telefonos solo de empleados\n" +
                        "4: Vista completa de correos y telefonos solo de clientes\n" +
                        "5: vista de empleados del area transporte\n" +
                        "6: vista de empleados del area ventas\n" +
                        "7: vista de empleados del area check_in \n" +
                        "8: vista de todos los tiquetes\n" +
                        "9: vista de todos los vuelos\n" +
                        "10: Historial de conduccion de los pilotos\n" +
                        "11: Historial de conduccion de los conductores\n" +
                        "12: vista de las personas que tienen equipaje \n" +
                        "13: contar cuantas maletas tiene una persona \n" +
                        "14: contar cuantos pasjeros tiene un vuelo \n" +
                        "15: crear un nuevo cliente \n" +
                        "0: SALIR");
    }

    private static void bienvenido()
    {
        System.out.println("---------------------------Bienvenido--------------------------\n" +
                "Este es el menu de la base de datos de la Aereolinea Aereosofka,\n" +
                "aqui podra realizar varias consultas y actualizaciones con el menu.");
        presioneTecla();
    }

    private static void presioneTecla()
    {
        String seguir;
        Scanner teclado = new Scanner(System.in);
        System.out.println("Presione ENTER para continuar...");
        try
        {
            seguir = teclado.nextLine();
        }
        catch(Exception e)
        {}
    }

    private static void terminado()
    {
        System.out.println("Saliendo..........");
    }

    private static void logout(){
        mySqlOperations.close();
    }

}
