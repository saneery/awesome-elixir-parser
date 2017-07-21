import React from "react";
import ReactDOM from "react-dom";
import {Contents} from "./contents";
import {List} from "./list";

class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = {data: null}
  }

  componentDidMount() {
    this.getData()
  }

  getData(min_stars) {
    if(min_stars) {
      $.get("/api/libraries", {min_stars: min_stars}).then(data=>{
        this.setState({data: data.data})
      })
      return;
    }
    $.get("/api/libraries").then(data=>{
      this.setState({data: data.data})
    })
  }

  render() {
    return <div>
      <header className="header">
        <h1>Awesome Elixir</h1>
        <nav role="navigation">
          <ul>
            <li className="filter">
              <a onClick={(e)=>{this.getData()}}>All</a>
            </li>
            <li className="filter">
              <a onClick={(e)=>{this.getData(50)}}>>=50</a>
            </li>
            <li className="filter">
              <a onClick={(e)=>{this.getData(100)}}>>=100</a>
            </li>
            <li className="filter">
              <a onClick={(e)=>{this.getData(500)}}>>=500</a>
            </li>
            <li className="filter">
              <a onClick={(e)=>{this.getData(1000)}}>>=1000</a>
            </li>
          </ul>
        </nav>
        <p>
          Elixir is awesome. And it has a vast awesome
          list: <a href="https://github.com/h4cc/awesome-elixir">
            h4cc/awesome-elixir
          </a>.
          This is a mirror of it where each library is marked with number of
          stars at <a href="https://github.com">Github</a> and number of days since the last commit.
        </p>
      </header>
      <Contents list={this.state.data}/>
      <List list={this.state.data}/>
    </div>
  }
}

export default App
