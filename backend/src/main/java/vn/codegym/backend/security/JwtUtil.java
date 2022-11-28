package vn.codegym.backend.security;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.SignatureException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.nio.charset.Charset;
import java.util.Date;

@Component
public class JwtUtil {
    public String message = "";
    private static final long EXPIRE_DURATION = 5 * 60 * 1000L;
    public static final Logger LOGGER = LoggerFactory.getLogger(JwtUtil.class);
    @Value("${app.jwt.secret}")
    private String SECRET_KEY;

    public String generateAccessToken(String username) {
        return Jwts.builder().
                setSubject(username).
                setIssuedAt(new Date()).
                setExpiration(new Date((new Date()).getTime() + EXPIRE_DURATION)).
                signWith(SignatureAlgorithm.HS512, this.SECRET_KEY.getBytes(Charset.forName("UTF-8"))).
                compact();
    }

    public boolean validateAccessToken(String authToken) {
        try {
            Jwts.parser().setSigningKey(this.SECRET_KEY.getBytes()).parseClaimsJws(authToken);
            return true;
        } catch (SignatureException ex) {
            message = "Liên kết đổi mật khẩu không hợp lệ.";
            LOGGER.error("Invalid JWT signature: {}", ex.getMessage());
        } catch (MalformedJwtException ex) {
            message = "Liên kết đổi mật khẩu không hợp lệ.";
            LOGGER.error("Invalid JWT token: {}", ex.getMessage());
        } catch (ExpiredJwtException ex) {
            message = "Liên kết đổi mật khẩu đã hết hiệu lực.";
            LOGGER.error("JWT token is expired: {}", ex.getMessage());
        } catch (UnsupportedJwtException ex) {
            message = "Liên kết đổi mật khẩu không hợp lệ.";
            LOGGER.error("JWT token is unsupported: {}", ex.getMessage());
        } catch (IllegalArgumentException ex) {
            message = "Liên kết đổi mật khẩu không hợp lệ.";
            LOGGER.error("JWT claims string is empty: {}", ex.getMessage());
        }
        return false;
    }

    public String getUsernameFromToken(String token) {
        return this.parseClaims(token).getSubject();
    }

    public Claims parseClaims(String token) {
        return (Claims)Jwts.parser().
                setSigningKey(this.SECRET_KEY.getBytes(Charset.forName("UTF-8"))).
                parseClaimsJws(token.replace("{", "").replace("}", "")).getBody();
    }
}