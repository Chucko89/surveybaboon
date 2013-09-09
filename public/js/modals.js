function Modal(){

}

Modal.prototype = {
  showModal: function(form) {
    $(form).easyModal({
      top: 200,
      overlay: 0.2,
      overlayColor: "#5688e6"
    });
    $(form).trigger('openModal');
  }
}

// function greatFunction(){
//     var chart = new CanvasJS.Chart("chartContainer", {
//       title:{
//         text: "Fruits sold in First Quarter"
//       },
//     //   data: [//array of datSeries]
//     //     {
//     //       type: "column",
//     //       dataPoints: [
//     //       { label: "banana", y: 12 },
//     //       { label: "orange", y: 20 },
//     //       { label: "apple", y: 40 },
//     //       { label: "mango", y: 34 },
//     //       { label: "grape", y: 24 }
//     //       ]
//     //     }
//     //   ]
//     // });

//           data: [  //array of dataSeries     
//       { //dataSeries - first quarter
//    /*** Change type "column" to "bar", "area", "line" or "pie"***/        
//        type: "pie",
//        name: "First Quarter",
//        dataPoints: [
//        { label: "banana", y: 18 },
//        { label: "orange", y: 29 },
//        { label: "apple", y: 40 },                                    
//        { label: "mango", y: 34 },
//        { label: "grape", y: 24 }
//        ]
//      },
//      { //dataSeries - second quarter

//       type: "pie",
//       name: "Second Quarter",                
//       dataPoints: [
//       { label: "banana", y: 23 },
//       { label: "orange", y: 33 },
//       { label: "apple", y: 48 },                                    
//       { label: "mango", y: 37 },
//       { label: "grape", y: 20 }
//       ]
//     },
//     {
//       type: "pie",
//       name: "Third Quarter",
//       dataPoints: [
//       { label: "banana", y: 30 },
//       { label: "orange", y: 12 }
//       ]
//     }
//     ]
//   });
//     chart.render();
//   };

$(document).ready(function(){
  // greatFunction();

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
      console.log("in ajax");
      $("#hidden_survey").append(server_data);
      modal.showModal('#survey_stats');
    });
  });

});