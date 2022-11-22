class SalesController < ApplicationController
def show
  @sales = Sales.all
end
end
