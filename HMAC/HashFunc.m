function [md] = HashFunc(Msg, Method)
    Engine = java.security.MessageDigest.getInstance(Method);
    Engine.update(uint8(Msg(:)));
    md = typecast(Engine.digest, 'uint8')';
end