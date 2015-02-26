React = require 'react'

SearchBar = React.createClass
  handleChange: ->
    @.props.onUserInput(
      @.refs.filterTextInput .getDOMNode().value,
      @.refs.inStockOnlyInput.getDOMNode().checked
    )

  render: ->
    <form>
      <input
        type="text"
        placeholder="search ..."
        value={this.props.filterText}
        ref="filterTextInput"
        onChange={this.handleChange}
      />
      <p>
        <input
          type="checkbox"
          checked={this.props.inStockOnly}
          ref="inStockOnlyInput"
          onChange={this.handleChange}
        />
        {' '}
        Only show products in stock
      </p>
    </form>

module.exports = SearchBar
