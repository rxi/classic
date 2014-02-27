# Classic

A tiny class module for Lua. Attempts to stay simple and provide decent
performance by avoiding unnecessary over-abstraction.


## Usage

The [module](classic.lua) should be dropped in to an existing project and
required by it:

```lua
Object = require "classic"
```

The module returns the object base class which can be extended to create any
additional classes.


### Creating a new class

```lua
Point = Object:extend()

function Point:new(x, y)
  self.x = x or 0
  self.y = y or 0
end
```


### Creating a new object

```lua
local p = Point(10, 20)
```


### Extending an existing class

```lua
Rect = Point:extend()

function Rect:new(x, y, width, height)
  Rect.super.new(self, x, y)
  self.width = width or 0
  self.height = height or 0
end
```


[Click here](usage.md) for more usage examples.


## License

This module is free software; you can redistribute it and/or modify it under
the terms of the MIT license. See [LICENSE](LICENSE) for details.

