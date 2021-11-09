import css from './Proof.module.css';
import { changeLang, g } from '../../i18n';
import { History } from './sidebar/History';
import { Toolbar } from './Toolbar';
import { Tabs } from './tabs/Tabs';
import { LemmaBox } from './sidebar/LemmaBox';

type ProofProps = {
  onFinish: () => void;
};

export const Proof = ({ onFinish }: ProofProps) => {
  return (
    <div className={css.main}>
      <h1 className={css.title}>
        <span>{g`babaeee_coq`}</span>
        <button className={css.changeLangButton} onClick={changeLang}>{g`change_lang`}</button>
        <button className={css.changeLangButton} onClick={onFinish}>{g`exit`}</button>
      </h1>
      <div className={css.bottomContainer}>
        <Toolbar />
        <Tabs onFinish={onFinish} />
        <div className={css.sidebarContainer}>
          <History />
          <LemmaBox />
        </div>
      </div>
    </div>
  );
};
