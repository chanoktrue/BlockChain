import UIKit

var greeting = "Hello, playground"

func getReviewIdsFromGoogle(completion: @escaping ([Int]) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        let result = Array(repeating: 0, count: 5).map {_ in
            return Int.random(in: 1...5)
        }
        completion(result)
    }
}

func getReviewIdsFromYelp(completion: @escaping ([Int]) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        let result = Array(repeating: 0, count: 5).map {_ in
            return Int.random(in: 6...10)
        }
        completion(result)
    }
}

func getReviewIdsFromNextDoor(completion: @escaping ([Int]) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        let result = Array(repeating: 0, count: 5).map {_ in
            return Int.random(in: 11...15)
        }
        completion(result)
    }
}

func getReviewIdsFromAmazon(group: DispatchGroup, completion: @escaping ([Int]) -> ()) {
    group.enter()
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        let result = Array(repeating: 0, count: 5).map { _ in
            return Int.random(in: 16...20)
        }
        completion(result)
        group.leave()
    }
}

func collectAllReviewIds() {
    let group = DispatchGroup()
    var reviewIds: [Int] = []
    
    group.enter()
    getReviewIdsFromGoogle { ids in
        reviewIds.append(contentsOf: ids)
        print(Date())
        group.leave()
    }
    
    group.enter()
    getReviewIdsFromYelp { ids in
        reviewIds.append(contentsOf: ids)
        print(Date())
        group.leave()
    }
    
    group.enter()
    getReviewIdsFromNextDoor { ids in
        reviewIds.append(contentsOf: ids)
        print(Date())
        group.leave()
    }
    
    getReviewIdsFromAmazon(group: group) { ids in
        print(Date())
        reviewIds.append(contentsOf: ids)
    }
    
    group.notify(queue: .global()) {
        // update in database
        print(reviewIds)
    }
}

collectAllReviewIds()
