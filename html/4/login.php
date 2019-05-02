$name = $_POST["username"];
$password = $_POST["password"];
$admin_user = "admin";
$student_user = "student";
$teacher_user = "teacher";

//数据库数据选择，读信息
$sql = 'SELECT user,id,password FROM login_info';
mysqli_select_db( $conn, 'tmp' );
$retval = mysqli_query($conn,$sql);
if(!retval)
{
	die()
}
