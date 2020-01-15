import React from "react"
import PropTypes from "prop-types"


class ExchangeRate extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      rate_view: this.viewableRate(this.props.rate)
    };

    this.listenChangeEvent();
  }

  viewableRate(rate) {
    const viewRate = +rate;
    return viewRate.toFixed(2)
                   .replace('.', ',')
                   .concat(' ₽');
  }

  listenChangeEvent() {
    const changeRateEvent = CONSTANTS.Events['change-rate'];
    const that = this;
    $(document).on(changeRateEvent, data => that.updateRateFromSource(data.rate));
  }

  updateRateFromSource() {
    const that = this;
    $.getJSON('/', data =>
      that.setState({
        rate_view: that.viewableRate(data.rate),
      })
    );
  }

  render () {
    return (
      <div className={this.props.classes}>
        {this.state.rate_view}
      </div>
    );
  }
}

ExchangeRate.propTypes = {
  rate: PropTypes.string
};


export default ExchangeRate
