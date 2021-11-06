function test(){
  echo "WINCH\n"
}
trap "test" WINCH
