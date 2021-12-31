# Classic

Uma pequena implementação da abstração do uso de classes para Lua. Se atentando em manter um simples e decente
desempenho evitando abstrações excessivamente desnecessárias.


## Modo de uso

O [módulo](classic.lua) deve ser adicionado em um projeto já existente e declarado
da seguinte maneira abaixo:

```lua
Object = require "classic"
```

O módulo retorna a classe base do objeto que pode posteriormente ser extendida para
quaisquer classes adicionais.


### Criando uma nova classe
```lua
Point = Object:extend()
function Point:new(x, y)
  self.x = x or 0
  self.y = y or 0
end
```

### Criando um novo objeto
```lua
local p = Point(10, 20)
```

### Extendendo uma classe já existente
```lua
Rect = Point:extend()
function Rect:new(x, y, width, height)
  Rect.super.new(self, x, y)
  self.width = width or 0
  self.height = height or 0
end
```

### Verificando o tipo de um objeto
```lua
local p = Point(10, 20)
print(p:is(Object)) -- true
print(p:is(Point)) -- true
print(p:is(Rect)) -- false 
```

### Usando mixins
```lua
PairPrinter = Object:extend()
function PairPrinter:printPairs()
  for k, v in pairs(self) do
    print(k, v)
  end
end
Point = Object:extend()
Point:implement(PairPrinter)
function Point:new(x, y)
  self.x = x or 0
  self.y = y or 0
end
local p = Point()
p:printPairs()
```

### Usando variáveis estáticas
```lua
Point = Object:extend()
Point.scale = 2
function Point:new(x, y)
  self.x = x or 0
  self.y = y or 0
end
function Point:getScaled()
  return self.x * Point.scale, self.y * Point.scale
end
```

### Criando um meta-método
```lua
function Point:__tostring()
  return self.x .. ", " .. self.y
end
```


## Licença

Este módulo é um software livre; você pode redistribuir e/ou modifica-lo sobre
os termos da licença MIT. Clique [aqui](LICENSE) para melhores detalhes.
