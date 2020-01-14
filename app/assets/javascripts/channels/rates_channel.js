App.cable.subscriptions.create('RatesChannel', {
  received(data) {
    $('#rate-value').html(data);
  }
});
