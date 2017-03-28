package nl.sltn.services.CountryService.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @RequestMapping("/rest")
    public String index() {
        return "Greetings from Spring Boot!";
    }

}
