React = require 'react'

ProductRow = React.createClass
  render: ->
    name = if this.props.product.stocked
      this.props.product.name
    else
      <span style={{color:'red'}}>
        {this.props.product.name}
      </span>

    <tr>
      <td>{name}</td>
      <td>{this.props.product.price}</td>
    </tr>

module.exports = ProductRow
