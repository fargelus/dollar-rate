$(() => {
  const updateRates = () => {
    setTimeout(() => {
      $.getJSON('/', data => $(document).trigger(
        CONSTANTS.Events['change-rate'],
        data.rate
      ));
    }, CONSTANTS.Timer.second);
  };

  $(document).on(CONSTANTS.Events.timeout, updateRates);
});
