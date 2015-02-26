React = require 'react'

FilterableProductTable = require './components/filterableProductTable.coffee'

PRODUCTS = [
  {category:'goods', price:'$49.99', stocked:true, name:'Football'},
  {category:'goods', price:'$9.99',  stocked:true, name:'Baseball'},
  {category:'goods', price:'$29.99', stocked:false, name:'Basketball'},
  {category:'eletronics', price:'$99.99', stocked:true, name:'iPod'},
  {category:'eletronics', price:'$399.99', stocked:false, name:'iPhone'},
  {category:'eletronics', price:'$199.99', stocked:true, name:'nexus'}
]

React.render <FilterableProductTable products={PRODUCTS}/>, document.getElementById 'content'
