package dao;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class PersistenceDAO {
    private static final SessionFactory sessionFactory = buildSessionFactory();
    private static final Map<String,String> LOCAL_CONFIGURATION = getLocalConfiguration();
    private static final Map<String,String> HEROKU_CONFIGURATION = getHerokuConfiguration();
    private static final String POSTGRES_DRIVER_CLASS = "org.postgresql.Driver";
    private static final String POSTGRES_DIALECT = "org.hibernate.dialect.PostgreSQL10Dialect";
    private static final String LOCAL_MYSQL_DRIVER_CLASS = "com.mysql.cj.jdbc.Driver";
    private static final String LOCAL_MYSQL_DIALECT = "org.hibernate.dialect.MySQL57Dialect";
    private static final String LOCAL_MYSQL_CONNECTION_URL = "jdbc:mysql://localhost:3306/zpro?userSSL=false";
    private static final String LOCAL_MYSQL_USER = "tarang";
    private static final String LOCAL_MYSQL_PASSWORD = "tarang";
    private static boolean SERVER = false;
    private static SessionFactory buildSessionFactory() {
        try {
            String HEROKU_POSTGRES = System.getenv("JDBC_DATABASE_URL");
            ServiceRegistry registry;
            if (null != HEROKU_POSTGRES) {
                registry = buildServiceRegistry(getHerokuConfiguration());
                SERVER = true;
            } else {
                registry = buildServiceRegistry(getLocalConfiguration());
                SERVER = false;
            }
            return new Configuration().configure().buildSessionFactory(registry);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    public static void reset(){
        ServiceRegistry registry;
        Map<String,String> configuration = new HashMap<>();
        configuration.put(Environment.HBM2DDL_AUTO,"create-drop");
        if(SERVER){
            configuration.putAll(HEROKU_CONFIGURATION);
        }else{
            configuration.putAll(LOCAL_CONFIGURATION);
        }
        registry = buildServiceRegistry(configuration);
        new Configuration().configure().buildSessionFactory(registry);
    }
    private static Map<String,String> getLocalConfiguration(){
        Map<String, String> LOCAL_SETTINGS = new HashMap<>();
        LOCAL_SETTINGS.put(Environment.URL, LOCAL_MYSQL_CONNECTION_URL);
        LOCAL_SETTINGS.put(Environment.DRIVER, LOCAL_MYSQL_DRIVER_CLASS);
        LOCAL_SETTINGS.put(Environment.DIALECT, LOCAL_MYSQL_DIALECT);
        LOCAL_SETTINGS.put(Environment.USER, LOCAL_MYSQL_USER);
        LOCAL_SETTINGS.put(Environment.PASS, LOCAL_MYSQL_PASSWORD);
        return LOCAL_SETTINGS;
    }
    private static Properties getLocalProperties(){
        Properties properties = new Properties();
        try {
            properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("local.properties"));
            return properties;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
    private static Map<String,String> getHerokuConfiguration(){
        Map<String, String> HEROKU_SETTINGS = new HashMap<>();
        HEROKU_SETTINGS.put(Environment.URL, System.getenv("JDBC_DATABASE_URL"));
        HEROKU_SETTINGS.put(Environment.DRIVER, POSTGRES_DRIVER_CLASS);
        HEROKU_SETTINGS.put(Environment.DIALECT, POSTGRES_DIALECT);
        return HEROKU_SETTINGS;
    }
    private static ServiceRegistry buildServiceRegistry(Map<String,String> configuration){
        return new StandardServiceRegistryBuilder().
                configure("hibernate.cfg.xml").
                applySettings(configuration).
                build();
    }
    public static void shutdown() {
        sessionFactory.close();
    }
}
