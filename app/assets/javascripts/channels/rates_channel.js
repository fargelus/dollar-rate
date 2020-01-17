App.cable.subscriptions.create('RatesChannel', {
  received(data) {
    const { Events } = CONSTANTS;
    $.getJSON('/', data => {
      $(document).trigger(Events['change-rate'], data.rate);
      $(document).trigger(Events['update-timer'], data.force_date);
    });
  }
});
