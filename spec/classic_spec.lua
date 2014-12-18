Object = require "classic"

-- BaseClass provides a say() method
local BaseClass = Object:extend()
function BaseClass:new(name)
  self._name = name
end
function BaseClass:getName()
  return self._name
end
function BaseClass.getSomething()
  return "something"
end

-- ClassOne extends BaseClass
local ClassOne = BaseClass:extend()
function ClassOne:new(name)
  ClassOne.super.new(self, name)
end
function ClassOne.getSomething()
  return "something better"
end

-- ClassTwo extends BaseClass
local ClassTwo = BaseClass:extend()
function ClassTwo:new(name)
  if name == "wrong" then
    error("Wrong value")
  end
  ClassTwo.super.new(self, name)
end

describe("classic #classic", function()
  describe("Base tests", function()

    it("Constructors should work", function()
      local classOne = ClassOne("Mark")
      local classTwo = ClassTwo("John")

      assert.are.same("Mark", classOne:getName())
      assert.are.same("John", classTwo:getName())
    end)
    it("Static method should work", function()
      local classOne = ClassOne("Mark")
      local classTwo = ClassTwo("John")

      assert.are.same("something better", classOne:getSomething())
      assert.are.same("something", classTwo:getSomething())
    end)
    it("Constructor returns error", function()
      local status, res = pcall(ClassTwo, "wrong")

      assert.falsy(status)
      assert.truthy(res)
      assert.are.same("Wrong value", string.sub(res, string.len(res) - 10))
    end)

  end)
end)