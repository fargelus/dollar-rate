import React from "react"
import PropTypes from "prop-types"
import TimeSince from "../helpers/time_since";
import TimeoutDispatcher from '../helpers/timeout_dispatcher';


class Timer extends React.Component {
  constructor(props) {
    super(props);

    this.timeLeft = TimeSince(props.timeout);
    this.state = {
      remainTime: this.timeLeftView(),
    };

    Timer.SECOND = 1000;
    this.tick();
  }

  timeLeftView() {
    let { hours, minutes, seconds } = this.timeLeft;
    hours = this.zeroView(hours);
    minutes = this.zeroView(minutes);
    seconds = this.zeroView(seconds);
    return `${hours}:${minutes}:${seconds}`;
  }

  zeroView(param) {
    return ('' + param).length == 1 ? `0${param}` : param;
  }

  tick() {
    const that = this;
    const iID = setInterval(() => {
      that.countDown();
      that.setState({
        remainTime: that.timeLeftView()
      });

      if (that.timeExpired()) {
        TimeoutDispatcher();
        clearInterval(iID);
      }
    }, Timer.SECOND);
  }

  timeExpired() {
    const { hours, minutes, seconds } = this.timeLeft;
    return hours == 0 && minutes == 0 && seconds == 0;
  }

  countDown() {
    let { hours, minutes, seconds } = this.timeLeft;
    if (seconds > 0) {
      seconds -= 1;
    } else if (minutes > 0) {
      minutes -= 1;
      seconds = 59;
    } else if (hours > 0) {
      hours -= 1;
      minutes = 59;
    }

    this.timeLeft = { hours: hours, minutes: minutes, seconds: seconds };
  }

  render() {
    const timeout = this.timeExpired();
    return (
      <div className={timeout ? 'fade-out' : ''}>
        До обновления курса осталось: { this.state.remainTime }
      </div>
    );
  }
}

Timer.propTypes = {
  timeout: PropTypes.string
};


export default Timer
