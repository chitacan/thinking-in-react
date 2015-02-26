React = require 'react'

ProductCategoryRow = React.createClass
  render: ->
    <tr>
      <th colSpan="2">{this.props.category}</th>
    </tr>

module.exports = ProductCategoryRow
