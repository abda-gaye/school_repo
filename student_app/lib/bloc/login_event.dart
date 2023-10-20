class LoginEvent{}

class LoginAuthEvent extends LoginEvent{
   String login;
   String password;

   LoginAuthEvent({
     required this.login,
     required this.password,
});


}

class LoginButtonPressed extends LoginEvent{}