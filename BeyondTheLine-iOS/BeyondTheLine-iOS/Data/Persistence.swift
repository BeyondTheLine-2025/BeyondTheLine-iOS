//
//  Persistence.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/6/25.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "BeyondTheLine_iOS")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        insertDummyDataIfNeeded(context: container.viewContext)
    }
}

extension PersistenceController {
    func insertDummyDataIfNeeded(context: NSManagedObjectContext) {
        let request: NSFetchRequest<Situation> = Situation.fetchRequest()
        request.fetchLimit = 1
        
        if let count = try? context.count(for: request), count > 0 {
            return
        }
        
        // MARK: - Background
        
        let background = Background(context: context)
        background.id = UUID()
        
        // MARK: - Situation
        
        let situation1 = Situation(context: context)
        situation1.id = UUID()
        situation1.title = "카페"
        
        let situation2 = Situation(context: context)
        situation2.id = UUID()
        situation2.title = "편의점"
        
        // MARK: - Customer
        
        let customer1 = Customer(context: context)
        customer1.id = UUID()
        customer1.name = "김민지"
        customer1.age = 24
        customer1.learningCount = 0
        customer1.introMessage = "20대로 보이는 여성 손님이\n카페로 들어왔어요."
        customer1.summaryFeedbacks = [
            "복잡한 주문일수록 한 번에 정리해 듣고, 확인하는 절차가 중요해요.",
            "요청사항을 존중하며, 정확하고 따뜻하게 응대하는 것이 고객 만족도를 높이는 열쇠예요."
        ] as NSArray
        
        // MARK: - Simulator Quiz (1)
        
        let simQuiz1 = SimulatorQuiz(context: context)
        simQuiz1.id = UUID()
        simQuiz1.preText = "아이스 바닐라라떼에 샷 2번만 넣어주시고요.\n시럽은 빼고, 우유는 두유로 바꿔주시고,\n얼음은 적게 부탁드릴게요."
        simQuiz1.correctAnswer = "네 맞아요~ 완전 감사해요!"
        simQuiz1.wrongAnswer = "......?"
        simQuiz1.isWarning = false
        simQuiz1.order = 0
        
        let quiz1 = Quiz(context: context)
        quiz1.id = UUID()
        quiz1.question = "어덯게 답하는게 좋을까요?"
        quiz1.answers = [
            "잠깐만요, 너무 많아서 잘 모르겠는데요?",
            "우유만 두유로 바꾸면 되는 거죠?",
            "아이스 바닐라라떼에 샷 2번, 시럽은 빼고,\n우유는 두유로, 얼음은 적게 맞으실까요?"
        ] as NSArray
        quiz1.answerIndex = 2
        quiz1.feedbacks = [
            "이런 반응은 고객에게 부담을 줄 수 있어요.\n복잡한 주문일수록 정리해서 복창하는 것이 좋아요.",
            "일부만 확인하면 나머지 요청을 놓치기 쉬워요.\n전체 요청을 정리해서 확인하는 편이 좋아요.",
            "고객의 요청을 정확히 정리해 복창하는 방식은 실수를 줄이고, 신뢰를 줍니다."
        ] as NSArray
        simQuiz1.quiz = quiz1
        
        // MARK: - Simulator Quiz (2)

        let simQuiz2 = SimulatorQuiz(context: context)
        simQuiz2.id = UUID()
        simQuiz2.preText = "옆에서 듣던 동료가\n지금 두유가 품절이라고 얘기했어요."
        simQuiz2.correctAnswer = "그럼 저지방으로 바꿔주세요."
        simQuiz2.wrongAnswer = "......?"
        simQuiz2.isWarning = true
        simQuiz2.order = 1
        
        let quiz2 = Quiz(context: context)
        quiz2.id = UUID()
        quiz2.question = "어덯게 답하는게 좋을까요?"
        quiz2.answers = [
            "지금 두유가 없는데\n그냥 다른 음료로 바꾸실래요?",
            "죄송하지만 현재 두유는 품절이라\n저지방우유나 일반우유로 변경 도와드릴까요?",
            "두유 없어요. 그냥 일반으로 드릴게요."
        ] as NSArray
        quiz2.answerIndex = 1
        quiz2.feedbacks = [
            "고객의 선택을 제한하는 말투는 지양해야 해요.",
            "대안과 선택지를 함께 제시하는 방식은, 고객의 불편을 줄여줍니다.",
            "고객의 선택권을 무시하는 응답입니다."
        ] as NSArray
        simQuiz2.quiz = quiz2
        
        // MARK: - Simulator Quiz (3)

        let simQuiz3 = SimulatorQuiz(context: context)
        simQuiz3.id = UUID()
        simQuiz3.preText = ""
        simQuiz3.correctAnswer = "감사합니다."
        simQuiz3.wrongAnswer = "......?"
        simQuiz3.isWarning = false
        simQuiz3.order = 2
        
        let quiz3 = Quiz(context: context)
        quiz3.id = UUID()
        quiz3.question = "손님의 요청이 끝났어요.\n어떻게 마무리 하면 좋을까요?"
        quiz3.answers = [
            "네~ 고객님, 정성껏 준비해드릴게요.\n잠시만 기다려주세요!",
            "네네, 할게 참 많아졌네요.",
            "다음 손님이요~"
        ] as NSArray
        quiz3.answerIndex = 0
        quiz3.feedbacks = [
            "주문 내용을 이해했음을 표현하고, 고객의 요청을 존중하는 따뜻한 응답이에요.",
            "농담처럼 들릴 수 있지만, 고객이 부담을 느낄 수 있어요.",
            "빠른 응대처럼 보일 수 있으나, 친절도가 낮아 보여요."
        ] as NSArray
        simQuiz3.quiz = quiz3
        
        // MARK: - Last Quiz (1)
        
        let lastQuiz1 = Quiz(context: context)
        lastQuiz1.id = UUID()
        lastQuiz1.question = "다음중 손님이 요청한\n커스터마이징 항목이 아닌 것은?"
        lastQuiz1.answers = [
            "샷 2번 추가",
            "시럽 제거",
            "두유 변경",
            "얼음 작게",
            "따뜻한 음료로 변경"
        ] as NSArray
        lastQuiz1.answerIndex = 3
        
        // MARK: - Last Quiz (2)
        
        let lastQuiz2 = Quiz(context: context)
        lastQuiz2.id = UUID()
        lastQuiz2.question = "커스터마이징이 많은 주문을 받았을 때\n가장 중요한 응대 방법은?"
        lastQuiz2.answers = [
            "너무 복잡한 건 거절하기",
            "요청사항을 정확히 듣고 복창하며 확인하기",
            "인기 메뉴로 유도해서 간단히 주문하기"
        ] as NSArray
        lastQuiz2.answerIndex = 1
        
        // MARK: - Add Array
        
        customer1.simulatorQuizs = [simQuiz1, simQuiz2, simQuiz3]
        
        customer1.lastQuizs = [lastQuiz1, lastQuiz2]
        
        situation1.customers = [customer1]
        
        background.situations = [situation1, situation2]
    }
}
