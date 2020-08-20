"use strict";

$('#get-notification').on('submit', (evt) => {
  evt.preventDefault();

  const selectedId = $('#notification-id').val();

  $.get(`/api/notification/${selectedId}`, (res) => {
    $('#checklistid').html(res.checklistid);
    $('#datesenttoreview').html(res.datesenttoreview);
    $('#reviewerfullname').html(res.reviewerfullname);
    $('#revieweremail').html(res.revieweremail);
    $('#datereviewcomplete').html(res.datereviewcomplete);
    $('#datetorecipient').html(res.datetorecipient);
    $('#recipientfullname').html(res.recipientfullname);
    $('#recipientemail').html(res.recipientemail);
  });
});