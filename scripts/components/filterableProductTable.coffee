React = require 'react'

ProductTable = require './productTable.coffee'
SearchBar    = require './SearchBar.coffee'

FilterableProductTable = React.createClass
  getInitialState: ->
    filterText: ''
    inStockOnly: false

  handleUserInput: (filterText, inStockOnly)->
    @.setState
      filterText: filterText
      inStockOnly: inStockOnly

  render: ->
    <div>
      <SearchBar 
        filterText={this.state.filterText}
        inStockOnly={this.state.inStockOnly}
        onUserInput={this.handleUserInput}
      />
      <ProductTable
        products={this.props.products}
        filterText={this.state.filterText}
        inStockOnly={this.state.inStockOnly}
      />
    </div>

module.exports = FilterableProductTable
