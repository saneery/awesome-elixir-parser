import React from "react";
import ReactDOM from "react-dom";

export class List extends React.Component {

  getList() {
    var list = $.map(this.props.list, el => {
      var id = el.name.replace(/ /g, '-').toLowerCase()
      return <div key={el.id}>
        <h3 id={id} dangerouslySetInnerHTML={{__html: el.name}}/>
        <p dangerouslySetInnerHTML={{__html: el.description}}/>
        <ul>{this.getLibraries(el.libraries)}</ul>
      </div>
    })
    return list
  }

  getLibraries(libs) {
    var list = $.map(libs, el => {
      return <li key={el.id}>
        <p dangerouslySetInnerHTML={{__html: el.name}}/>
        <p>stars: {el.stars}</p>
        <p>last commit: {el.last_commit} days ago</p>
      </li>
    })
    return list;
  }

  render() {
    return <div>{this.getList()}</div>
  }
}
