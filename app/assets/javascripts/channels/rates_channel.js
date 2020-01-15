App.cable.subscriptions.create('RatesChannel', {
  received(data) {
    $(document).trigger('change-rate', data.rate);
  }
});
