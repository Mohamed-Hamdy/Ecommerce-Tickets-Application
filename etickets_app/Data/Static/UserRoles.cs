

namespace eTickets.Data.Static
{
    public static class UserRoles
    {
        public const string Admin = "Admin";
        public const string User = "User";
        public const string SuperUser = "SuperUser";
        public const string AdminAndSuperUser = Admin + "," + SuperUser;
    }
}