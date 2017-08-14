
//
//  DiaryStore.swift
//  CocoaBaby
//
//  Created by Sohn on 11/08/2017.
//  Copyright © 2017 Sohn. All rights reserved.
//

import Foundation

class DiaryStore {
    
    static let shared = DiaryStore()
    
    var currentDiaries: [Int:Diary] = [:]
    
    /// Description
    /// <주의>기존 다이어리 데이터인 currentDiaries 데이터 모두 삭제 후 데이터 fetch
    /// - Parameters:
    ///   - date: date
    ///   - completion: com
    func fetchDiaries(date: Diary.Date, completion: @escaping () -> ()) {
        
        currentDiaries.removeAll()
        
        FireBaseAPI.fetchDiaries(date: date) { (diaries) in
            for diary in diaries {
                self.currentDiaries[diary.date.day] = diary
            }
            
            OperationQueue.main.addOperation {
                completion()
            }
        }
    }
    
    func saveDiary(diary: Diary, completion: @escaping (DiaryResult) -> ()) {
        
        FireBaseAPI.saveDiary(diary: diary) { diaryResult in
            OperationQueue.main.addOperation {
                // currentDiary에 방금 넣은 다이어리 추가
                switch diaryResult {
                case let .success(diary):
                    self.currentDiaries[diary.date.day] = diary
                    
                    completion(diaryResult)
                case .failure(_):
                    completion(diaryResult)
                }
                
            }
        }
    }
}
