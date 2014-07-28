package ar.edu.itba.paw.presentation;

import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.paw.domain.assistance.AssistanceRepo;
import ar.edu.itba.paw.domain.payment.CashPaymentRepo;
import ar.edu.itba.paw.domain.payment.Debt;
import ar.edu.itba.paw.domain.payment.DebtRepo;
import ar.edu.itba.paw.domain.service.ServiceRepo;
import ar.edu.itba.paw.domain.user.Person;
import ar.edu.itba.paw.domain.user.PersonRepo;
import ar.edu.itba.paw.domain.user.UserRepo;
import ar.edu.itba.paw.presentation.command.CreatePaymentForm;
import ar.edu.itba.paw.presentation.command.RegisterEnrollmentForm;
import ar.edu.itba.paw.presentation.command.validator.CreatePaymentFormValidator;
import ar.edu.itba.paw.presentation.command.validator.RegisterAssistanceFormValidator;

@Controller
public class PaymentController {

	private CashPaymentRepo paymentRepo;
	private DebtRepo debtRepo;
	private CreatePaymentFormValidator validator;

	@Autowired
	public PaymentController(CashPaymentRepo paymentRepo, DebtRepo debtRepo,
			CreatePaymentFormValidator validator) {
		super();
		this.paymentRepo = paymentRepo;
		this.debtRepo = debtRepo;
		this.validator = validator;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listAll(HttpSession session,
			@RequestParam(value = "person_id", required = false) Person person,
			@RequestParam(value = "start", required = false) DateTime start,
			@RequestParam(value = "end", required = false) DateTime end) {

		UserManager usr = new SessionManager(session);
		if (!usr.existsUser())
			return new ModelAndView("redirect:../user/login?error=unauthorized");

		ModelAndView mav = new ModelAndView();
		mav.addObject("payments", paymentRepo.getAll(person, start, end));
		return mav;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView debts(HttpSession session,
			@RequestParam(value = "person_id", required = false) Person person,
			@RequestParam(value = "start", required = false) DateTime start,
			@RequestParam(value = "end", required = false) DateTime end,
			@RequestParam(value = "error", required = false, defaultValue = "false") Boolean error) {

		UserManager usr = new SessionManager(session);
		if (!usr.existsUser())
			return new ModelAndView("redirect:../user/login?error=unauthorized");

		ModelAndView mav = new ModelAndView();

		// mav.addObject("debts", debtRepo.get(person, start, end));
		mav.addObject("debts", debtRepo.getAll());
		mav.addObject("error", error);
		mav.addObject("createPaymentForm", new CreatePaymentForm());
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView pay(HttpSession session, CreatePaymentForm form,
			Errors errors) {
		UserManager usr = new SessionManager(session);
		if (!usr.existsUser())
			return new ModelAndView("redirect:../user/login?error=unauthorized");

//		validator.validate(form, errors);
//		if (errors.hasErrors()) {
//			return new ModelAndView("redirect:../payment/debts?error=true");			
//		}
		
		Debt debt = debtRepo.get(Integer.parseInt(form.getDebtId()));
		debt.pay();
		return new ModelAndView("redirect:../payment/listAll");
	}
}
