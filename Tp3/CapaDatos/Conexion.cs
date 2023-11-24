using System.Configuration;

namespace CapaDatos
{
    public class Conexion
    {
        public static string CN = ConfigurationManager.ConnectionStrings["oConexion"].ConnectionString;
    }
}
