React = require 'react'

ProductRow         = require './productRow.coffee'
ProductCategoryRow = require './productCategoryRow.coffee'

ProductTable = React.createClass
  render: ->
    rows = []
    lastCategory = null
    @.props.products.forEach (product) =>
      return if product.name.indexOf(@.props.filterText) is -1 or (!product.stocked and @.props.inStockOnly)
      if product.category isnt lastCategory
        rows.push(
          <ProductCategoryRow category={product.category} key={product.category} />
        )
      rows.push <ProductRow product={product} key={product.name}/>
      lastCategory = product.category

    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Price</th>
        </tr>
      </thead>
      <tbody>{rows}</tbody>
    </table>

module.exports = ProductTable
