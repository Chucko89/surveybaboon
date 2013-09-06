$(document).ready(function() {

// VALIDATION TESTS:
function test_email(input_email){ return input_email.match(/.+@.+\..{2,3}/)};
function test_pass_num(input_password){return input_password.match(/\d/)};
//function test_pass_caps(input_password){return input_password.match(/[A-Z]+/)};


// FORM VALIDATION:
$('form#signup').on('submit',function(e){
  e.preventDefault();

console.log("after submitting button")

$('#signup_errors').html('') //clears previous attempt errors
  var validates = true
  var email = $("input[name='email']").val();
  var password = $("input[name='password']").val();

if (test_email(email))
    {console.log('email validation passed')}
    else {
      $('#signup_errors').append("<li>'invalid email format'</li>");
      validates = false
    };

if (test_pass_num(password)){}
    else {
      $('#singup_errors').append("<li>password must contain a number</li>");
      validates = false;
    };


if (password.length > 7){}
    else {
      $('#signup_errors').append("<li>password must be at least 8 chars long</li>");
      validates = false;
    };

// if (test_pass_caps(password)){}
//     else {
//       $('#errors').append("<li>password contains one caps</li>");
//       validates = false
//     };

if (validates) {
    $("input[name='sign_up']").submit()
    $('#errors').append("<li id='ok'>FORM SUBMITTED SUCCESFULLY</li>");
 
  };
 
  })
 
}); 

