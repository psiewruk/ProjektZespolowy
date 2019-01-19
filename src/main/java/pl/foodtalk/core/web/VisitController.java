package pl.foodtalk.core.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.foodtalk.core.model.Visit;
import pl.foodtalk.core.service.VisitService;

public class VisitController {
    @Autowired
    private VisitService visitService;

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String visit(@ModelAttribute("visitForm") Visit visitForm, BindingResult bindingResult, Model model) {
        visitService.save(visitForm);

        return "redirect:/restautant";
    }
}
