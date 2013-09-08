function Modal(){

}

Modal.prototype = {
  showModal: function(form) {
    $(form).easyModal({
      top: 200,
      overlay: 0.2
    });
    $(form).trigger('openModal');
  }
}

$(document).ready(function(){
  $('#created_surveys a').on('click', function(e){
    e.preventDefault();
    $('#survey_stats').remove();
    $('.lean-overlay').remove();
    var sendUrl = $(this).attr('href');
    var modal = new Modal();
    $.ajax({
      url: sendUrl,
      type: this.method,
      dataType: "html"
    }).done(function (server_data) {
      var modal = new Modal();
      $("#hidden_survey").append(server_data);
      modal.showModal('#survey_stats');
      console.log("in modal");
    });
  });

});