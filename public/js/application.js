$(document).ready(function() {

// VALIDATION TESTS:
function test_email(input_email){return input_email.match(/.+@.+\..{2,3}/);}
function test_pass_num(input_password){return input_password.match(/\d/);}
// function test_pass_caps(input_password){return input_password.match(/[A-Z]+/)};
function unbind(validation){
  if (validation){
  $('#signup_errors').append("<li>'Succesful Signup'</li>");
  $('form#signup').unbind('submit');
  $('form#signup').submit();
  }
}

// FORM VALIDATION:
$('form#signup').on('submit',function(e){
  e.preventDefault();
  validation = true;
  console.log("button");
  
  $('#signup_errors').html(''); //clears previous attempt errors
    
    var email = $("input[name='email']").val();
    var password = $("input[name='password']").val();

  if (test_email(email)){
    console.log('email validation passed');
  }
    else {
      $('#signup_errors').append("<li>Invalid email format</li>");
      validation = false;
    }

  if (test_pass_num(password)){
    console.log("number test passed");
  }
    else {
      $('#signup_errors').append("<li>password must contain a number</li>");
      validation = false;
    }


  if (password.length > 7){
    console.log("length test passed");
  }
    else {
      $('#signup_errors').append("<li>password must be at least 8 chars long</li>");
      validation = false;
    }

// // if (test_pass_caps(password)){}
// //     else {
// //       $('#errors').append("<li>password contains one caps</li>");
// //       validation = false;
// //     }
 
      
      unbind(validation);
 
  });

$('#login').on('submit',function(e){
  e.preventDefault();

  $('#login_errors').html('');

  var email = $("input[name='login_email']").val();
  var password = $("input[name='login_password']").val();

  if (email){}
  else {
    $('#login_errors').append("<li>email cannot be blank</li>");
    validation = false;
  }
  if (password){}
  else {
    $('#login_errors').append("<li>password cannot be blank</li>");
    validation = false;
  }

  if (test_email(email)){
    console.log('email validation passed');
  }
    else {
      $('#login_errors').append("<li>invalid email format</li>");
      validation = false;
    }

  if (validation){
    $('#login_errors').append("<li>'Succesful Signup'</li>");
    $('#login').unbind('submit');
    $('#login').submit();
  }

});

});  //document ready


