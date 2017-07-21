import React from "react";
import ReactDOM from "react-dom";

export class Contents extends React.Component {
  render() {
    var list = $.map(this.props.list, el => {
      var ref = '#' + el.name.replace(/ /g, '-').toLowerCase()
      return <li key={el.id}><a href={ref} dangerouslySetInnerHTML={{__html: el.name}}/></li>
    })
    return <div>
    <h2>Contents</h2>
    {list}
    </div>
  }
}
