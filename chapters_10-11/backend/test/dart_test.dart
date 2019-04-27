import 'package:backend/controllers/todo_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
    group("counter keeps track of completed todos", () {
        final counter = CompletedTodoCounter();
        test("counter increases and decreases", () {
            counter.increaseCounter();
            expect(counter.completed, 1);

            counter.increaseCounter(); // +1
            counter.decreaseCounter(); // -1
            counter.increaseCounter(); // +1
            counter.increaseCounter(); // +1
            counter.decreaseCounter(); // -1
            expect(counter.completed, 2);
        });

        test("counter resets to 0", () {
            counter.increaseCounter();
            counter.increaseCounter();
            counter.increaseCounter();
            counter.increaseCounter();

            counter.resetCounter();

            expect(counter.completed, 2);
        });
    });
}