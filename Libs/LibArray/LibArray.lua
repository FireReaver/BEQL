local fn, mt;

fn = {};

fn.concat = function(...)
    local t = newArray();

    for i = 1, select('#', ...) do
        local _t = select(i, ...);

        if ( type(_t) == 'table' and _t.GetType == nil) then
            for _, v in pairs(_t) do
                tinsert(t, v);
            end
        else 
            tinsert(t, _t);
        end
    end

    return t;
end

fn.fill = function(t, value, iStart, iEnd)
    if (type(tonumber(iStart)) ~= 'number') then
        iStart = 1;
    end

    if (type(tonumber(iEnd)) ~= 'number') then
        iEnd = #t;
    end

    for k in pairs(t) do
        if (k >= iStart and k <= iEnd) then 
            t[k] = value;
        end
    end

    return t;
end

fn.filter = function(t, fn)
    local r = newArray();

    if(type(fn) ~= 'function') then 
        fn = function() return false end
    end

    for k, v in pairs(t) do
        if(fn(v, k, t)) then
            tinsert(r, v);
        end
    end

    return r;
end

fn.find = function(t, fn)
    if(type(fn) ~= 'function') then 
        fn = function() return false end
    end

    for k, v in pairs(t) do
        if(fn(v, k, t)) then
            return v;
        end
    end
end

fn.findIndex = function(t, fn, iStart)
    if(type(fn) ~= 'function') then 
        fn = function() return false end
    end

    if (type(tonumber(iStart)) ~= 'number') then
        iStart = 1;
    end

    for k, v in pairs(t) do
        if(k >= iStart and fn(v, k, t)) then
            return k;
        end
    end

    return -1
end

fn.forEach = function(t, fn)
    if(type(fn) ~= 'function') then 
        fn = function() return false end
    end

    for k, v in pairs(t) do
        fn(v, k, t);
    end
end

fn.includes = function(t, value, iStart)
    return t.indexOf(value, iStart) >= 0;
end

fn.indexOf = function(t, value, iStart)
    if (type(tonumber(iStart)) ~= 'number') then
        iStart = 1;
    end

    for k, v in pairs(t) do
        if(k >= iStart and v == value) then
            return k;
        end
    end

    return -1;
end

fn.join = function(t, seperator)
    local s = '';
    local sep = '';

    for k, v in pairs(t) do
        if(v == nil) then 
            s = s .. sep .. '';
        else
            s = s .. sep .. tostring(v);
        end

        sep = tostring(seperator);
    end

    return s;
end
    
fn.keys = function(t)
    local r = newArray();

    for k in pairs(t) do
        tinsert(r, k);
    end

    return r;
end

fn.lastIndexOf = function(t, value, iStart)
    local lastIndex = -1;

    if (type(tonumber(iStart)) ~= 'number') then
        iStart = 1;
    end

    for k, v in pairs(t) do
        if(v == value and k >= iStart) then
            lastIndex = k;
        end
    end

    return lastIndex;
end

fn.map = function(t, fn)
    local r = newArray();

    if(type(fn) ~= 'function') then 
        fn = function() end
    end

    for k, v in pairs(t) do
        local result = fn(v,k,t);

        if (result ~= nil) then
            tinsert(r, k, result); 
        end
    end

    return r;
end

fn.pop = function(t)
    local index, value;

    for k, v in pairs(t) do
        index = k;
        value = v;
    end

    tremove(t, index);

    return value;
end

fn.push = function(t, ...)
	local field;

    for i = 1, select('#', ...) do
		field = select(i, ...);
        if(field ~= nil) then
            t[#t+1] = field;
        end
    end

    return #t;
end

fn.reverse = function(t) 
    local keys = {};
    local values = {};

    for k, v in pairs(t) do
        tinsert(keys, 1, k);
        tinsert(values, v);
    end

    for i, key in ipairs(keys) do
        t[key] = values[i];
    end

    return t;
end

fn.shift = function(t)
    for k, v in pairs(t) do
        tremove(t, k);

        return v;
    end
end

fn.slice = function(t, iStart, iEnd)
    local r = newArray();

    if (type(tonumber(iStart)) ~= 'number') then
        iStart = 1;
    end

    if (type(tonumber(iEnd)) ~= 'number') then
        iEnd = #t;
    end

    if(iStart < 1 ) then
        iStart = #t + iStart;
    end

    if(iEnd < 1 ) then
        iEnd = #t + iEnd;
    end

    for k, v in pairs(t) do
        if(k >= iStart and k <= iEnd) then
            r.push(v)
        end
    end

    return r;
end

fn.some = function(t, fn)
    return #t.filter(fn) > 0
end

fn.sort = function(t, fn)
    table.sort(t, fn);

    return t;
end

fn.splice = function(t, iStart, iCount, ...)
    local keys = {};
    local newItems = {...};

    if (type(tonumber(iStart)) ~= 'number' or iStart == 0) then
        iStart = #t + 1;
    end

    if (type(tonumber(iCount)) ~= 'number') then
        iCount = #t;
    end

    if(iStart < 0 ) then
        iStart = #t + iStart;
    end

    if(iCount < 0 ) then
        iCount = 0;
    end

    local r = t.slice(iStart,  iStart + iCount - 1);

    while (iCount > 0) do
        tremove(t, iStart);
        iCount = iCount - 1;
    end

    for k, v in ipairs(newItems) do
        tinsert(t, iStart + (k - 1), v);
    end

    return r;
end

fn.toString = function(t)
    local mt, s;
    mt = getmetatable(t);
    setmetatable(t, nil);
    s = tostring(t):gsub('table', 'array');
    setmetatable(t, mt);

    return s--tring.replace(s, 'table', 'array');
end

fn.unshift = function(t, ...)
    local newItems = {...};

    fn.reverse(newItems);

    for _, v in ipairs(newItems) do
        tinsert(t, 1, v);
    end

    return #t;
end

fn.values = function(t)
    local r = newArray();

    for _, v in pairs(t) do
        tinsert(r, v);
    end

    return r;
end

function mt()
    local mt = {}
    mt.__call = function(t, ...)
        local name = getmetatable(t).fnName;

        if (fn[name] ~= nil) then
            return fn[name](t, ...);
        end

        error('unknown methode ' .. tostring(name));
    end
    mt.__index = function(t, index)
        local iIndex = tonumber(index);

        if (type(iIndex) == 'number') then
            return rawget(t, iIndex);
        end

        if(fn[index]) then
            getmetatable(t).fnName = index;
            return t;
        end
    end

    mt.__len = function(t)
        print('__len', t);
        local keys = t.keys();

        local i = 0;
        for k, v in ipairs(keys) do
            i = i + 1;
        end

        print(t , 'len', math.max(i, math.max(keys)), math.max(i, math.max(keys)) or 0)

        return math.max(i, math.max(keys)) or 0;
    end

    mt.__newindex = function(t, index, value)
        local iIndex = tonumber(index);

        if (type(iIndex) ~= 'number') then
            error('index must be an number, got ' .. type(iIndex))
        end

        if(value == nil) then
            print(t, index, value)
        end

        rawset(t, iIndex, value);

        return value;
    end

    mt.__tostring = function(t)
        return fn.toString(t);
    end

    mt.fnName = nil

    return mt;
end



function newArray(...)
    local t = setmetatable({}, mt());
    t.push(...);

    return t;
end

function toArray(t)
    if (type(t) == 'table') then
        return setmetatable(t, mt());
    end
    
    return t;
end