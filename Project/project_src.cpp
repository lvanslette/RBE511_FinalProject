#include "project_src.h"
#include "buzz/buzzvm.h"


static CRange<Real> STIMULUS_RANGE(-20.0, 20.0);

/**
 * Functor to put the stimulus in the Buzz VMs.
 */
struct PutStimuli : public CBuzzLoopFunctions::COperation {

   /** Constructor */
   PutStimuli(const std::vector<Real>& vec_stimuli) : m_vecStimuli(vec_stimuli) {}
   
   /** The action happens here */
   virtual void operator()(const std::string& str_robot_id,
                           buzzvm_t t_vm) {
      /* Set the values of the table 'stimulus' in the Buzz VM */
      BuzzTableOpen(t_vm, "obj");
      for(int i = 0; i < m_vecStimuli.size(); ++i) {
         BuzzTablePut(t_vm, i, static_cast<float>(m_vecStimuli[i]));
      }
      BuzzTableClose(t_vm);
   }

   /** Calculated stimuli */
   const std::vector<Real>& m_vecStimuli;
};

/****************************************/
/****************************************/

void CThresholdModel::Init(TConfigurationNode& t_tree) {
   /* Call parent Init() */
   CBuzzLoopFunctions::Init(t_tree);

   /* Create a new RNG */
   m_pcRNG = CRandom::CreateRNG("argos");
   /* Initialize the stimuli */
   m_vecStimuli.resize(2);
   for(int i = 0; i < m_vecStimuli.size(); ++i) {
      m_vecStimuli[i] = STIMULUS_RANGE.GetMax() * 0.01;
   }
   /* Open the output file */
   m_cOutFile.open(m_strOutFile.c_str(),
                   std::ofstream::out | std::ofstream::trunc);
}

/****************************************/
/****************************************/

void CThresholdModel::Reset() {
   /* Reset the stimuli */
   for(int i = 0; i < m_vecStimuli.size(); ++i) {
      m_vecStimuli[i] = STIMULUS_RANGE.GetMax() * 0.01;
   }
   /* Convey the stimuli to every robot */
   BuzzForeachVM(PutStimuli(m_vecStimuli));
   /* Reset the output file */
   m_cOutFile.open(m_strOutFile.c_str(),
                   std::ofstream::out | std::ofstream::trunc);

}

/****************************************/
/****************************************/

void CThresholdModel::Destroy() {
   m_cOutFile.close();
}

/****************************************/
/****************************************/

void CThresholdModel::PostStep() {

    // Obtain the space instance
    CSpace& cSpace = CSimulator::GetInstance().GetSpace();

    // Get the entity by ID (replace "movable_box" with your entity's ID)
    argos::CBoxEntity& cBox = dynamic_cast<argos::CBoxEntity&>(cSpace.GetEntity("transport"));

    // Get the position of the object
    const CVector3& cPosition = cBox.GetEmbodiedEntity().GetOriginAnchor().Position;

   /* Update the stimuli */
   m_vecStimuli[0] = cPosition.GetX();
   m_vecStimuli[1] = cPosition.GetY();
   STIMULUS_RANGE.TruncValue(m_vecStimuli[0]);
   STIMULUS_RANGE.TruncValue(m_vecStimuli[1]);
   /* Convey the stimuli to every robot */
   BuzzForeachVM(PutStimuli(m_vecStimuli));

/*
   // Flush data to the output file 
   if(!cGetRobotData.m_vecRobotsThresholds.empty()) {
      for(int i = 0; i < GetNumRobots(); ++i) {
         m_cOutFile << GetSpace().GetSimulationClock() << "\t"
                    << i << "\t"
                    << cGetRobotData.m_vecRobotsTasks[i];
         for(int j = 0; j < m_vecStimuli.size(); ++j) {
            m_cOutFile << "\t" << cGetRobotData.m_vecRobotsThresholds[i][j];
         }
         m_cOutFile << std::endl;
      }
   }
*/
}

/****************************************/
/****************************************/

bool CThresholdModel::IsExperimentFinished() {
   /* Feel free to try out custom ending conditions */
   return false;
}

/****************************************/
/****************************************/

int CThresholdModel::GetNumRobots() const {
   return m_mapBuzzVMs.size();
}

/****************************************/
/****************************************/

void CThresholdModel::BuzzBytecodeUpdated() {
   /* Convey the stimuli to every robot */
   BuzzForeachVM(PutStimuli(m_vecStimuli));
}

/****************************************/
/****************************************/

REGISTER_LOOP_FUNCTIONS(CThresholdModel, "project_src");
