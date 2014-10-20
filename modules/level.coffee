c = require './constants'

class Level
  constructor: (obj) ->
    @cells = obj.layers[0].data # cell rendering data
    @collision_cells = @cells
    @image = new Image()
    @objects = []
    #console.log 'uhggg', obj
    @width  = obj.width * c.TILE
    @height = obj.height * c.TILE
    @cols = obj.width
    @rows = obj.height
    #c.MAP.tw = obj.width
    #c.MAP.th = obj.height


  # get the cell value for the cell at x,y expressed in pixels
  # type is 'render' or 'collision'
  cellValue: (x, y, type='render') ->
    @tileToValue @pixelToTile(x), @pixelToTile(y), type


  pixelToTile: (p) -> Math.floor p / c.TILE


  tileToPixel: (t) -> t * c.TILE

  # get the value at the given cell
  # type is 'render' or 'collision'
  # example  tileTovalue(0,1, cells) returns the value at col 0, row 1
  tileToValue: (tx, ty, type='render') ->
    if type is 'render'
      @cells[tx + (ty * @cols)]
    else
      @collision_cells[tx + (ty * @rows)]

  # get the tile entity: mainly useful for hitbox property
  tileEntity: (tx, ty) ->
    val = @tileToValue tx, ty
    if val
      type: "tile"
      value: val
      x : tx * c.TILE
      y : ty * c.TILE
      width : c.TILE
      height : c.TILE

module.exports = Level
