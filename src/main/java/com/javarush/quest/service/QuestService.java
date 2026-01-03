package com.javarush.quest.service;

import com.javarush.quest.model.QuestStep;

import java.util.HashMap;
import java.util.Map;

public class QuestService {
    private final Map<String, QuestStep> steps = new HashMap<>();

    public QuestService() {
        initSteps();
    }

    private void initSteps() {

        // 1. Start
        steps.put("start", new QuestStep(
                "start",
                "You wake up with zero memory… and a UFO is calling you on SPACE Zoom. Answer?",
                "Answer the UFO call",
                "Decline (pretend you're in a tunnel)",
                "accept",
                "lose_ignore"
        ));

        // 2. You answered
        steps.put("accept", new QuestStep(
                "accept",
                "You answered. The screen shows an alien with a headset.",
                "Go aboard the UFO",
                "Say 'Wrong number' and run",
                "boarding",
                "lose_run"
        ));

        // 3. Boarding
        steps.put("boarding", new QuestStep(
                "boarding",
                "You step inside. The air smells like strawberries… and mild suspiciousness.",
                "Follow the glowing arrows",
                "Touch the big red button (because science)",
                "bridge",
                "red_button"
        ));

        // 4. Red button branch
        steps.put("red_button", new QuestStep(
                "red_button",
                "Alarm! A robotic voice yells: 'WHO TOUCHED THE BUTTON?!' (It was you.)",
                "Admit it proudly",
                "Blame the nearest plant",
                "lose_button",
                "plant_trial"
        ));

        // 5. Plant trial
        steps.put("plant_trial", new QuestStep(
                "plant_trial",
                "The plant is taken away for questioning. It looks disappointed in you.",
                "Confess and apologize to the plant",
                "Double down: 'That plant looked guilty!'",
                "bridge",
                "lose_plant"
        ));

        // 6. Bridge (main path)
        steps.put("bridge", new QuestStep(
                "bridge",
                "You reach the bridge. The Captain turns slowly in a dramatic chair-spin. Classic.",
                "Approach the Captain politely",
                "Sneak to the snack dispenser first",
                "captain",
                "snacks"
        ));

        // 7. Snacks branch
        steps.put("snacks", new QuestStep(
                "snacks",
                "You find a vending machine labeled: 'HUMAN TREATS (probably safe)'.",
                "Buy 'Cosmic Chips'",
                "Buy 'Quantum Cola'",
                "chips",
                "cola"
        ));

        steps.put("chips", new QuestStep(
                "chips",
                "The chips taste like regret and paprika. The Captain is watching you chew.",
                "Offer chips to the Captain",
                "Hide the chips behind your back",
                "captain",
                "lose_chips"
        ));

        steps.put("cola", new QuestStep(
                "cola",
                "The cola is both cold and somehow… philosophical.",
                "Walk to the Captain confidently",
                "Shake the can and open it for fun",
                "captain",
                "lose_cola"
        ));

        // 8. Captain conversation
        steps.put("captain", new QuestStep(
                "captain",
                "Captain: 'State your identity, Earth creature.'",
                "Tell the truth: 'I honestly have no idea'",
                "Make something up dramatically",
                "truth",
                "lie"
        ));

        // 9. Truth branch
        steps.put("truth", new QuestStep(
                "truth",
                "Captain: 'Honesty. Rare. Suspiciously rare.' The crew murmurs respectfully.",
                "Accept the Captain's weird mission",
                "Ask to go home immediately",
                "mission",
                "home_request"
        ));

        // 10. Lie branch
        steps.put("lie", new QuestStep(
                "lie",
                "You: 'I am... the Supreme Galactic Tax Inspector.' The Captain narrows all three eyes.",
                "Commit harder to the lie",
                "Panic and switch to truth",
                "lose_lie",
                "truth"
        ));

        // 11. Ask to go home
        steps.put("home_request", new QuestStep(
                "home_request",
                "Captain: 'We can return you… but first you must answer the ship’s security question.'",
                "Answer confidently: 'Pizza!'",
                "Answer wisely: 'It depends on the context...'",
                "win_home",
                "mission"
        ));

        // 12. Mission branch (NO AI)
        steps.put("mission", new QuestStep(
                "mission",
                "Captain: 'Good news. You are not being probed today.'\n" +
                        "Bad news: the ship is stuck in 'Intergalactic Drive-Thru Mode' and refuses to move.\n" +
                        "We need you to deal with the Space Drive-Thru clerk.",
                "Talk to the drive-thru clerk politely",
                "Declare yourself 'Manager of the Universe'",
                "drive_thru",
                "lose_manager"
        ));

        // 13. Drive-thru
        steps.put("drive_thru", new QuestStep(
                "drive_thru",
                "A speaker crackles: 'Welcome to Nebula Burger. Please stop screaming. May I take your order?'",
                "Order something normal (to build trust)",
                "Ask what the Captain actually ordered",
                "order_normal",
                "order_captain"
        ));

        // 14. Normal order
        steps.put("order_normal", new QuestStep(
                "order_normal",
                "You: 'One burger, please.'\n" +
                        "Clerk: 'Finally. A stable lifeform.' The ship calms down a little.",
                "Pay with Earth money (confidently wrong)",
                "Pay with a shiny button you found earlier",
                "lose_money",
                "button_pay"
        ));

        // 15. Captain's order
        steps.put("order_captain", new QuestStep(
                "order_captain",
                "Clerk: 'The Captain ordered… 300 pickles. No burger. Just pickles.'\n" +
                        "The crew looks embarrassed. The Captain pretends to examine the ceiling.",
                "Confirm the pickle order (support your Captain)",
                "Suggest a normal meal instead",
                "pickles",
                "normal_meal"
        ));

        // 16. Pay with button -> win
        steps.put("button_pay", new QuestStep(
                "button_pay",
                "The clerk gasps: 'IS THAT… a Prehistoric Earth Button?!'\n" +
                        "They accept it with reverence. The ship exits Drive-Thru Mode and can finally fly.",
                "Ask the Captain to send you home",
                "Ask for a lifetime supply of cosmic chips",
                "win_home",
                "win_chips"
        ));

        // 17. Pickles path
        steps.put("pickles", new QuestStep(
                "pickles",
                "A crate of pickles arrives. The ship smells like victory… and vinegar.\n" +
                        "The Drive-Thru Mode releases its grip. The engines purr.",
                "Use the momentum to request a ride home",
                "Open the crate and start a pickle empire",
                "win_home",
                "lose_pickles"
        ));

        // 18. Normal meal suggestion
        steps.put("normal_meal", new QuestStep(
                "normal_meal",
                "Clerk: 'A reasonable suggestion detected. Initiating Respect Protocol.'\n" +
                        "The ship seems impressed by your basic common sense.",
                "Request to go home",
                "Request a tour of the ship",
                "win_home",
                "bridge"
        ));

        // ===================== FINAL STEPS (WINS) =====================
        steps.put("win_home", new QuestStep(
                "win_home",
                "You are returned safely to Earth. You still have no memory, but you DO have cosmic chips. Victory!",
                null, null, null, null
        ));

        steps.put("win_chips", new QuestStep(
                "win_chips",
                "The Captain salutes you and hands over a lifetime supply of cosmic chips.\n" +
                        "You return to Earth as a legend… with excellent snacks. Victory!",
                null, null, null, null
        ));

        // ===================== FINAL STEPS (LOSSES) =====================
        steps.put("lose_ignore", new QuestStep(
                "lose_ignore",
                "You decline the UFO call. Five minutes later you regret it forever. Defeat!",
                null, null, null, null
        ));

        steps.put("lose_run", new QuestStep(
                "lose_run",
                "You run away heroically… straight into a space parking ticket. Defeat!",
                null, null, null, null
        ));

        steps.put("lose_button", new QuestStep(
                "lose_button",
                "You proudly admit pressing the button. The crew applauds… then ejects you (politely). Defeat!",
                null, null, null, null
        ));

        steps.put("lose_plant", new QuestStep(
                "lose_plant",
                "You blame the plant again. The ship's court rules: 'Uncool.' Defeat!",
                null, null, null, null
        ));

        steps.put("lose_chips", new QuestStep(
                "lose_chips",
                "You hide the chips. The Captain says: 'A snack-hoarder is not to be trusted.' Defeat!",
                null, null, null, null
        ));

        steps.put("lose_cola", new QuestStep(
                "lose_cola",
                "You shake the can and open it. The bridge becomes a soda waterfall.\n" +
                        "You are promoted to 'Mop Commander'. Defeat!",
                null, null, null, null
        ));

        steps.put("lose_lie", new QuestStep(
                "lose_lie",
                "Captain: 'We don’t have taxes in space. We have WORSE.'\n" +
                        "You are sentenced to eternal paperwork. Defeat!",
                null, null, null, null
        ));

        steps.put("lose_manager", new QuestStep(
                "lose_manager",
                "You demand to speak to the Manager of the Universe.\n" +
                        "The Universe politely declines. You are assigned to customer service forever. Defeat!",
                null, null, null, null
        ));

        steps.put("lose_money", new QuestStep(
                "lose_money",
                "You slap down Earth money.\n" +
                        "Clerk: 'Is this… paper? Adorable.' The ship locks into Drive-Thru Mode permanently. Defeat!",
                null, null, null, null
        ));

        steps.put("lose_pickles", new QuestStep(
                "lose_pickles",
                "You attempt to start a pickle empire.\n" +
                        "Within minutes, the crew starts calling you 'Pickle Lord' unironically.\n" +
                        "This is your life now. Defeat!",
                null, null, null, null
        ));
    }

    public QuestStep getStep(String id) {
        return steps.get(id);
    }

    public boolean isFinalStep(String stepId) {
        QuestStep step = steps.get(stepId);
        return step != null && step.getOption1() == null;
    }
}
