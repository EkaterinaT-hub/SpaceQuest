package org.spacequest;

import com.javarush.quest.model.QuestStep;
import com.javarush.quest.service.QuestService;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class QuestServiceTest {

    private final QuestService questService = new QuestService();

    @Test
    void shouldReturnStartStep() {
        QuestStep step = questService.getStep("start");
        assertNotNull(step, "Шаг 'start' должен существовать");
    }

    @Test
    void shouldReturnNullForUnknownStep() {
        QuestStep step = questService.getStep("unknown_step_123");
        assertNull(step, "Для неизвестного шага ожидаем null");
    }

    @Test
    void shouldHandleNullIdGracefully() {
        assertDoesNotThrow(() -> {
            QuestStep step = questService.getStep(null);
            assertNull(step, "Для null ожидаем null (если ты так задумал)");
        });
    }

    @Test
    void shouldHandleEmptyIdGracefully() {
        assertDoesNotThrow(() -> {
            QuestStep step = questService.getStep("");
            assertNull(step, "Для пустой строки ожидаем null (если ты так задумал)");
        });
    }
}
